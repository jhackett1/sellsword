class CreateCharges < ActiveRecord::Migration[5.2]
  def change
    create_table :charges do |t|
      t.string :description, null: false
      t.text :notes
      t.float :rate, null: false
      t.float :hours, null: false
      t.references :invoice, foreign_key: true

      t.timestamps
    end
  end
end
