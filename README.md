# README

To start the project, please run the following command, assuming that Docker is already available.

```
docker-compose up --build
```

To deploy to the world, please follow the following step:

- Register an account in Heroku

![Register account](guides/register-account.png)

- Create your first app (ex: 'rails-girl-demo') in Heroku console

![Register account](guides/create-app-1.png)
![Register account](guides/create-app-2.png)

- Add Postgres Plugin

![Register account](guides/config-postgres-1.png)
![Register account](guides/config-postgres-2.png)
![Register account](guides/config-postgres-3.png)
![Register account](guides/config-postgres-4.png)

- Run `heroku login`
- Run `heroku container:login`
- Run `heroku container:push web --app <<APP NAME>>`
- Run `heroku container:release web --app <<APP NAME>>`

To re-deploy, please follow the following step:
- Run `heroku container:push web --app <<APP NAME>>`
- Run `heroku container:release web --app <<APP NAME>>`
