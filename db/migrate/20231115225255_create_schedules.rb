class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.references :medic, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
