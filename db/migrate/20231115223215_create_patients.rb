class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.references :user, null: false, foreign_key: true
      t.date :dob
      t.string :sex
      t.string :cpf

      t.timestamps
    end
  end
end
