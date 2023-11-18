class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :patient, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
