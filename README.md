# Volunteer Tracker

#### By _**Z Perez**_

A web application created to track projects and the volunteers working on them.

## Technologies Used

* _HTML_
* _Ruby_
* _rspec_
* _pry_
* _Capybara_
* _Sinatra_
* _PostgreSQL_


## Description

This application was created to demonstrates my understanding of using CRUD functionality, routing with Sinatra, testing with Capybara and creating a database with PostgreSQL. It allows a user to add multiple projects and assign multiple volunteers to those projects. The user can update and delete both projects and volunteers.

## User Stories

* _As a non-profit employee, I want to view, add, update and delete projects._
* _As a non-profit employee, I want to view and add volunteers._
* _As a non-profit employee, I want to add volunteers to a project._

## Setup/Installation Requirements
* _You will need to install the following before proceeding (click on the link to follow the installation process):_
_[Ruby](https://www.ruby-lang.org/en/documentation/installation/),_
_[PostgreSQL](https://www.postgresql.org/docs/current/tutorial-install.html)_


* _Go to [GitHub](https://github.com/zperez0/volunteer_tracker)_
* _Clone git repository to local machine_
* _Navigate to root folder and open directory with VScode_
* _Install packages (type in the terminal):_
```
bundle install
```

#### Database setup:
* _create database (type in the terminal):_
```
createdb volunteer_tracker
```
* _Open postgres (type in the terminal):_
```
postgres
```
* _Open a new terminal tab to start psql (type in the terminal):_
```
psql
```
* _Connect to database (type in the terminal):_
```
\c volunteer_tracker 
```
* _Create tables in psql (type in the terminal):_
```
CREATE TABLE projects (id serial PRIMARY KEY, title varchar)
CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int)
```
* _Open a new terminal tab to create a test database (type in the terminal):_
```
createdb -T volunteer_tracker volunteer_tracker_test
```

#### Server:
* _Run server (type in the terminal):_
```
ruby  app.rb
```

* _Open up your browser and go to:_
```
http://localhost:4567/
```

#### Test:

* _Run test with rpsec (type in the terminal):_
```
rspec
```

## Database Schema
![volunteer schema image](/public/volunteer_schema.png)

## Known Bugs
* _No known issues_

## License
[MIT](https://choosealicense.com/licenses/mit/)

Copyright (c) _2022_, _Z Perez_