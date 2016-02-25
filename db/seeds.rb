# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pass = "geheim"

admin = User.create email: 'admin@system.de',
                    password: pass,
                    password_confirmation: pass

user = User.create email: 'user@system.de',
                    password: pass,
                    password_confirmation: pass

admin.add_role :admin
user.add_role :user

puts "Admin password is #{pass}"
puts "User password is #{pass}"