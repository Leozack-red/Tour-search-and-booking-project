class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:cities, :photo, true)
  end
end
