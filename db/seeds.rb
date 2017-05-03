# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.

user = User.new(:email => "web@matheusloureiro.com.br", :password => "web@1qwer", :password_confirmation => "web@1qwer", :name => "Matheus Loureiro", :type_user => 1)
user.skip_confirmation!
user.save

user = User.new(:email => "desenvolvimento@matheusloureiro.com.br", :password => "web@1qwer", :password_confirmation => "web@1qwer", :name => "Matheus Loureiro", :type_user => 1)
user.skip_confirmation!
user.save