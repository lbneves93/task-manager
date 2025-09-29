# Prompt 1

## Project Description:

Please, build a restfull API using ruby on rails for a simple task management system. I'll send to you the next prompts explain how you will create this application. Wait the next prompts.


## Prompt 2:

## Project Archtecture:

Please, create a ruby on rails application with rails 8.0.3, using docker with image ruby:3.2.0, with a docker-compose to deal with web and database containers. For database use Postgres 15. For tests use gem "rspec-rails", For code quality use gem "rubocop". For serializer use gem "jsonapi-serializer".

## Prompt 3:

Please, create the following tables in database:

### Migrations:

1. Users Table: create the migration to build the users tables with the fields:   
  email:string not null default: "", with index  
  name:string not null default: "", 
  password:integer not null

2. Tasks Table: create the migration to build the tasks table with the fields:
  user:fk (user id), with index
  title:string not null default: "",   
  description:string not null default: "", 
  status:integer not null,
  due_date:datetime not null

### Seeds:

1. Create users seeds to populate the users table: Create 1 user, with the email: "taskmaker@email.com", name: "Task Maker", password: "123456". This seed needs to be the first one to run.

2. Create tasks seeds to populate the tasks table: Create 2 tasks: 
  First task: user: {user.id} (the user created on users seed), title: "Delete a Book", description: "As an user a need to be able to delete a book", status: 0, due_date: 1.week.from.now. This seed needs to run after the users seed.

## Prompt 4:

### Project Models:

Create the user model: 
  Relationship: This model has a relationship "has_many" with tasks.
  

Create the task model:
  Relationship: This model has a relationship "belongs to" with users.
  Validations: This model validates: user_id, title, description, status and due_date needs be present.

Create the spec for task model:  create rspec tests for the task model, one test for valid fields and other test for invalid fields. 


## Prompt 5:

### Project Controllers, Routes and Serializers:

Create the tasks_controller, with the following actions:

  1. index: List all tasks using "Task.includes(:user).all" operation to avoid n+1 problems, then create the task_serializer, that will return the attributes: :id, :title, :description, :status, :due_date. If has succes return status: 200, If has error return the status code for the error.

  2. show: List one task by id, id comes from params. Return the serialized response using task_serializer. If has success return status 200, if has error return the status code for the error.

  3. create: This action creates one task, getting the fields: :id, :title, :description, :status, :due_date from params, and create a new task record with this params. If has success return status 200, if has error on fields, return status: 400 with the errors array.

  4. update: This action updates a task record, getting the :id from path param, and the fields updated from the body params. Find the record by id and then update the fields according to params passed. If has success return status 200, if has error on fields, return status: 400 with the errors array.

  5. delete: This action delete a task record, getting the :id from path param, and then Find the record by id and delete.

Create the routes resource for tasks.
Create the rspec request specs for the tasks_controller actions.


## Prompt 6:

### Project Documentation:

Create the readme.md documentation for this application. Using this format:

### Project Description

Describe here whats is the project. Example: "Application to manage users tasks."

### Main Technologies

Describe here the main technologies like this example:

* Ruby version 3.2.0
* Rails version 8.0.3
* Postgresql version 15.2

### Running The Application

Describe here how to build and run the application using docker compose. And url and port development environment

### Setup the Database

Describe here how to create, migrate and seed the database.

### Running Tests

Describe here hw to run the rspec tests.

### Database ER Diagram

Here create a ER Diagram reading the db/schema.rb. Use mermaid to build the diagram.

### API Endpoints

Describe here the endpoints available on the application, following this example:

> Endpoint: GET http://localhost:3000/tasks
> Description: List all the tasks.
>








