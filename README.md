
# Project Title Shopping list

Used to add shopping list and recipes.
Application built in a container environment ( docker )

view online: https://shopping-list.bilka.networkmanager.pl/


## How to run

Run shoppping-list with docker

```bash
git submodule init
git submodule update

docker-compose up -d
```

## Tech Stack

**Client:** React, TS, Redux, ChakraUi, Vite

**Server:** Node, NestJs, TS

## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

**Database**
`MARIADB_ROOT_PASSWORD: password`
`MARIADB_DATABASE: database_name`

**Backend**      
`JWT_KEY: SECKRET_KEY`

`DB_TYPE: mysql`
`DB_HOST: db`
`DB_USERNAME: root`
`DB_DATABASE: db_shopping-list`
`DB_PASSWORD: password`

`FE_DOMAIN: localhost`
`FE_SSL: false # when you use https set true`

`FE_CORS_ORIGIN: http://localhost:3000`

`MAIL_USER: "user"`
`MAIL_PWD: "pwd"`
`MAIL_HOST: mailslurper`
`MAIL_PORT: 2500`

**Frontend**
`VITE_REACT_APP_API_URL: http://localhost:3002/api  # addres to BE`

    
## Demo

### Login

![login screen](https://github.com/BilkaDev/NestJs_React_Docker-Shopping-list/blob/main/docs/login.png)


### Product list 
Is used to add the products we will be adding to the list.

![product list](https://github.com/BilkaDev/NestJs_React_Docker-Shopping-list/blob/main/docs/product-list.png)

### Shopping list
Is used to manage shopping list.

![shopping list](https://github.com/BilkaDev/NestJs_React_Docker-Shopping-list/blob/main/docs/shopping-list.png)


### Recipe list
Is used to manage recipe.

![recipe list](https://github.com/BilkaDev/NestJs_React_Docker-Shopping-list/blob/main/docs/recipe-list.png)


### Chnage avatar
Is used to change avatar image.

![change avatar](https://github.com/BilkaDev/NestJs_React_Docker-Shopping-list/blob/main/docs/change-avatar.png)


