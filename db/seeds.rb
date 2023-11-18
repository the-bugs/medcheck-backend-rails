# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Especialidades

specialties = ["cardiologia", "ortopedia", "dermatologia", "pediatria"]

specialties.each do | specialty | 
	Specialty.create!(name: specialty)
end

# Usuários

@users = User.create!([
	{
		name: "Rodrigo",
		email: "rodrigocsm@ufba.br",
		password_digest: "a2s13d3a5s4d"
	},
	{
		name: "Usuário 2",
		email: "usuario2@ufba.br",
		password_digest: "a3s2d1a32sd16"
	}
])

# Pacientes

@patient = Patient.create!(user_id: @users[0].id, dob: Date.parse("1997-08-11"), sex: "masculino", cpf: "123456789-00")

# Prontuários

@record = Record.create!(patient_id: @patient.id, description: "Esse não passa de hoje ...")

# Médicos

@medic = Medic.create!(user_id: @users[1].id, specialty_id: 1, registry: "324654")

# Agendas

@schedule = Schedule.create!(medic_id: @medic.id, date: Date.new(2023, 12, 31))

# Consultas

@appointment = Appointment.create(medic_id: @medic.id, patient_id: @patient.id, date: @schedule.date, finished: false)
