# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Especialidade.create(nome: "Cardiologia")
Especialidade.create(nome: "Ortopedia")
Especialidade.create(nome: "Terapeuta")
Especialidade.create(nome: "Dermatologia")

puts "Especialidades created with success!"

User.create(name: "Maria", email: "maria@email.com", password: "123")

puts "Users created with success!"

Admin.create(name: "admin", email: "admin@email.com", password: "123")

puts "Admins created with success!"