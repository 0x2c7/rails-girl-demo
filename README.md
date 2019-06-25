# README

To start the project, please run the following command, assuming that Docker is already available.

```
docker-compose up --build
```

To open the web server, please access [http://localhost:4000](http://localhost:4000)

To deploy to the world, please follow the following step:

- Register an account in Heroku

![Register account](guides/register-account.png)

- Create your first app (ex: 'rails-girl-demo') in Heroku console

![Create app](guides/create-app-1.png)
![Create app](guides/create-app-2.png)

- Add Postgres Plugin

![Config Postgres](guides/config-postgres-1.png)
![Config Postgres](guides/config-postgres-2.png)
![Config Postgres](guides/config-postgres-3.png)
![Config Postgres](guides/config-postgres-4.png)

- Run `heroku login`
- Run `heroku container:login`
- Run `heroku container:push web --app <<APP NAME>>`
- Run `heroku container:release web --app <<APP NAME>>`

Click on "Open app", and enjoy

![Open application](guides/open-app.png)

To re-deploy, please follow the following step:
- Run `heroku container:push web --app <<APP NAME>>`
- Run `heroku container:release web --app <<APP NAME>>`
