class ChangeDatatypeFromIntegerToFloatInHours < ActiveRecord::Migration[5.2]
  def change
    change_column :hours, :hours, :float
  end
end
