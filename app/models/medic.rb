class Medic < ApplicationRecord
  belongs_to :user
  belongs_to :specialty
  has_many :appointments
  has_many :schedules
end
