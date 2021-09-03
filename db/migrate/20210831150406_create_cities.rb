class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :photo, null: false
      t.integer :weight, null: false

      t.timestamps
    end
  end
end
