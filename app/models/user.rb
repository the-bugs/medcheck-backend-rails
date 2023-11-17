class User < ApplicationRecord
	has_one :patient
	has_one :medic
	has_one :record, through: :patient
	has_one :specialty, through: :medic

	def is_patient?
		patient != nil
	end

	def is_medic?
		medic != nil
	end
end
