[![Build Status](https://travis-ci.org/valterbarros/scrum-poker.svg?branch=master)](https://travis-ci.org/valterbarros/scrum-poker)

### Modeling Scrum Poker

![](https://raw.githubusercontent.com/valterbarros/scrum-poker/master/modeling_project/logic-model.png)

## Dependencies

* Ruby version 2.5.0
* Rails version 5.1
* Postgres >= 9.5

You must have redis installed and running on the default port:6379 (or configure it in config/redis/cable.yml).
##### Add this .env to your clone or fork

```
DATABASE_HOST='localhost'
DATABASE_USERNAME='REPLACE WITH YOUR DATA'
DATABASE_PASSWORD='REPLACE WITH YOUR DATA'
DATABASE_NAME='planning_of_thrones_development'
DATABASE_TEST_NAME='planning_of_thrones_test'
DATABASE_PORT=5433
```

### Installing Redis
##### On Linux
* `wget http://download.redis.io/redis-stable.tar.gz`
* `tar xvzf redis-stable.tar.gz`
* `cd redis-stable`
* `make`
* `make install`

##### On Mac
* `brew install redis`

###### Note: You must have Ruby 2.2.2 installed in order to use redis

## Starting the servers

1. bundle install
2. rake db:create && rake db:migrate
3. redis-server
4. rails s
5. Visit `http://localhost:3000`

## Contributing
##### Branch name

  The name is composed by initials from your name (Valter Barros = VB), count of branch 01 is the my first branch, and a random number 58 followed by description from task.

  `eg: feature/VB0158-pass-modelling-to-models`
