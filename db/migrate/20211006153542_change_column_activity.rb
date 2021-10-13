class ChangeColumnActivity < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:activities, :description, true)
  end
end
