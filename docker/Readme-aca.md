# Deploy app in docker
## Create user defined network
```
docker network create app_network
```
## usercenter

```
docker run -d --name backend-db --network app_network -e MYSQL_ROOT_PASSWORD=pw  henry071190/backend_db
docker run -d --name backend --network app_network -p 8888:8888 -e DBHOST=backend-db henry071190/backend
docker run -d --name frontend --network app_network -p 3000:3000 -e REACT_APP_API_URL="http://localhost:8888" -e REACT_APP_RECIPE_API_URL="http://localhost:8889" henry071190/frontend
```

## recipe

```
docker run -d --name recipe-db --network app_network -e MYSQL_ROOT_PASSWORD=pw recipe-db
docker run -d --name recipe --network app_network -p 8889:8889 -e DBHOST=recipe-db recipe
```

# [BUILD] Build docker image
## Clone backend repo

```
git clone https://github.com/CloudEx-Seneca/CookingMaster_Backend.git
cd CookingMaster_Backend
```

## Building application docker image

```
docker build -t backend -f Dockerfile_usercenter . 
```

## Building mysql docker image

```
docker build -t backend_db -f Dockerfile_mysql . 
```

## DEPLOY USING ENV VARIABLE

```
export DBHOST=172.18.0.2
export DBPORT=3306
export DBUSER=root
export DATABASE=usercenter
export DBPWD=pw
```

## Run backend

```
docker run -d --name backend --network app_network -p 8888:8888 -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD  backend
```

## Run the application, make sure it is visible in the browser

```
docker run -d --name frontend --network app_network -p 3000:3000 -e DBHOST=$DBHOST -e DBPORT=$DBPORT -e  DBUSER=$DBUSER -e DBPWD=$DBPWD -e REACT_APP_API_URL="http://backend:8888"  henry071190/frontend
```
