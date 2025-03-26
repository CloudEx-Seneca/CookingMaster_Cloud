# DEPLOY NEWAPP
# Create docker networ

```
docker network create app_network
```
# Deploy db

```
docker run -d --name usercenter-db --network app_network -e MYSQL_ROOT_PASSWORD=pw  henry071190/usercenter-db
docker run -d --name recipe-db --network app_network -e MYSQL_ROOT_PASSWORD=pw henry071190/recipe-db
```

# Deploy apps

```
docker run -d --name usercenter --network app_network -p 8080:8080 -e SERVER_PORT=":8080" -e DB_HOST=usercenter-db -e MYSQL_ROOT_PASSWORD=pw henry071190/usercenter
docker run -d --name recipe --network app_network -p 8081:8081 -e SERVER_PORT=":8081" -e DB_HOST=recipe-db -e MYSQL_ROOT_PASSWORD=pw henry071190/recipe
```

# Deploy Frontend

```
docker run -d --name frontend --network app_network -p 3000:3000 -e REACT_APP_API_URL="http://localhost:8888" -e REACT_APP_RECIPE_API_URL="http://localhost:8889" henry071190/frontend
```

# Unit test:
### Test usercenter ###

```
curl -X 'POST' \
  'http://localhost:8080/usercenter/v2/register' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "email": "a@gmail.com",
  "password": "pw"
}'
```

### Test recipe ###

```
curl -X 'GET' \
  'http://localhost:8081/recipe/v2/list' \
  -H 'accept: application/json'\
```