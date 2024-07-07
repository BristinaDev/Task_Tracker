# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
Task.delete_all
User.delete_all

users = [
  { email: "user1@example.com", password: 'password', name: "John Doe" },
  { email: "user2@example.com", password: 'password', name: "Bristina Christian" },
]

users.each do |user_data|
  User.create!(user_data.merge(created_at: Time.now, updated_at: Time.now))
end

# Create tasks
tasks = [
  { name: "Buy groceries", due_date: Date.today + 1, user_id: User.first.id, status: 0 },
  { name: "Complete project report", due_date: Date.today + 2, user_id: User.second.id, status: 0 },
  { name: "Plan weekend trip", due_date: Date.today + 3, user_id: User.first.id, status: 0 },
  { name: "Attend meeting", due_date: Date.today + 4, user_id: User.second.id, status: 1 },
  { name: "Doctor's appointment", due_date: Date.today + 5, user_id: User.first.id, status: 0 },
  { name: "Finish book", due_date: Date.today + 6, user_id: User.first.id, status: 1 },
  { name: "Call plumber", due_date: Date.today + 7, user_id: User.second.id, status: 0 },
  { name: "Workout session", due_date: Date.today + 8, user_id: User.second.id, status: 1 },
  { name: "Send emails", due_date: Date.today + 9, user_id: User.first.id, status: 0 },
  { name: "Organize files", due_date: Date.today + 10, user_id: User.second.id, status: 0 },
  { name: "Organize files", due_date: Date.today - 5, user_id: User.second.id, status: 0 },
  { name: "Organize files", due_date: Date.today - 10, user_id: User.second.id, status: 0 },
  { name: "Organize files", due_date: Date.today - 1, user_id: User.first.id, status: 0 },
]

tasks.each do |task_data|
  Task.create!(task_data.merge(created_at: Time.now, updated_at: Time.now))
end

puts "Seeded #{User.count} users and #{Task.count} tasks."
