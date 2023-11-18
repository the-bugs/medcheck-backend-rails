class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :medic, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.datetime :date
      t.string :type
      t.boolean :finished

      t.timestamps
    end
  end
end
