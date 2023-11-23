specialties = [
	"cardiologia", "ortopedia", "dermatologia",
	"pediatria", "oncologia", "neurologia", "ginecologia",
	"urologia", "psiquiatria", "endocrinologia", "gastroenterologia",
	"geriatria", "hematologia", "infectologia", "nefrologia", "oftalmologia",
	"otorrinolaringologia", "pneumologia", "reumatologia", "alergologia", "angiologia",
	"cirurgia cardiovascular", "cirurgia da mão", "cirurgia de cabeça e pescoço",
	"cirurgia do aparelho digestivo", "cirurgia geral", "cirurgia pediátrica", "cirurgia plástica", 
	"cirurgia torácica", "cirurgia vascular", "coloproctologia", "medicina de emergência", "medicina do trabalho",
	"medicina esportiva", "medicina física e reabilitação", "medicina intensiva",
	"medicina legal e perícia médica", "medicina nuclear", "medicina preventiva e social", "neurocirurgia", 
	"nutrologia", "radiologia e diagnóstico por imagem", "radioterapia", 
	"medicina de urgência"
]

specialties.each do | specialty | 
	Specialty.create!(name: specialty)
end

# Usuários
@users = User.create!([
  {
	# admin
    name: "Admin",
    email: "admin@example.com",
    password: "admin",
    is_admin: true
  },
  {
	# paciente
    name: "Rodrigo",
    email: "rodrigocsm@ufba.br",
    password: "a2s13d3a5s4d",
    is_admin: true
  },
  {
	# paciente
    name: "João",
    email: "joao@ufba.br",
    password: "a3s2d1a32sd16"
  },
  {
	# médico
    name: "Maria",
    email: "maria@ufba.br",
    password: "a3s2d1a32sd16"
  },
  {
	# médico
    name: "Carlos",
    email: "carlos@ufba.br",
    password: "a3s2d1a32sd16"
  },
  { 
	# médico
    name: "Ana",
    email: "ana@ufba.br",
    password: "a3s2d1a32sd16"
  }
])


# Pacientes
@patient = Patient.create!([
	{
		user_id: @users[1].id, dob: Date.parse("1997-08-11"), sex: "masculino", cpf: "123456789-00"
	},
	{
		user_id: @users[2].id, dob: Date.parse("1997-08-11"), sex: "masculino", cpf: "123456789-00"
	},
])

# Prontuários

@record = Record.create!([
	{ patient_id: @patient[0].id, description: "Esse não passa de hoje ..." },
	{ patient_id: @patient[1].id, description: "É daqui pra pior..." }
])

# Médicos

@medic = Medic.create!([
	{user_id: @users[3].id, specialty_id: 1, registry: "324654"},
	{user_id: @users[4].id, specialty_id: 2, registry: "123456"}
])

# Agendas
@schedule = Schedule.create!([
	{medic_id: @medic[0].id, date: Date.new(2023, 12, 11)},
	{medic_id: @medic[1].id, date: Date.new(2023, 12, 11)}
])

# Consultas
@appointment = Appointment.create([
	{medic_id: @medic[0].id, patient_id: @patient[0].id, date: @schedule[0].date, finished: false},
	{medic_id: @medic[1].id, patient_id: @patient[1].id, date: @schedule[1].date, finished: false},
])
