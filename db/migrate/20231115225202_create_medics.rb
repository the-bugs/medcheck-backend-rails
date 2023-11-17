class CreateMedics < ActiveRecord::Migration[7.0]
  def change
    create_table :medics do |t|
      t.references :user, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true
      t.string :registry

      t.timestamps
    end
  end
end
