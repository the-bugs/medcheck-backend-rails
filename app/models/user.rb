class User < ApplicationRecord
  has_secure_password
	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	# validates :password,
  #           # length: { minimum: 8 },
  #           # if: -> { new_record? || !password.nil? }
  
	has_one :patient
	has_one :medic
	has_one :record, through: :patient
	has_one :specialty, through: :medic

	enum user_type: {
		Administrador: 0,
		Medico: 1,
		Paciente: 2,
	}

end
