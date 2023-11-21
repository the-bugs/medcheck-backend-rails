class User < ApplicationRecord
  has_secure_password
  after_initialize :default_values

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
		Medico: 1,
		Paciente: 2,
	}

	def admin?
		self.is_admin
	end

	private

	def default_values
		self.is_admin |= false
	end
end
