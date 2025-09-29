# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create users
user = User.find_or_create_by!(email: "taskmaker@email.com") do |u|
  u.name = "Task Maker"
  u.password = "123456"
end

# Create tasks
Task.find_or_create_by!(title: "Delete a Book") do |t|
  t.user = user
  t.description = "As an user a need to be able to delete a book"
  t.status = 0
  t.due_date = 1.week.from_now
end

Task.find_or_create_by!(title: "Update a Book") do |t|
  t.user = user
  t.description = "As an user a need to be able to update a book"
  t.status = 1
  t.due_date = 2.weeks.from_now
end
