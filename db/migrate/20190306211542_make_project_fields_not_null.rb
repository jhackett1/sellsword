class MakeProjectFieldsNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:projects, :name, false)
    change_column_null(:projects, :email, false)
    change_column_null(:projects, :address, false)
  end
end
