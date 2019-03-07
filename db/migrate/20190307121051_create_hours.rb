class CreateHours < ActiveRecord::Migration[5.2]
  def change
    create_table :hours do |t|
      t.string :description
      t.datetime :date
      t.integer :hours
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
