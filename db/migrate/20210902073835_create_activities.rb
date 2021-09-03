class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.references :city, null: false, foreign_key: true
      t.string :title, null: false
      t.string :description, null: false
      t.string :photo, null: false
      t.string :price, null: false
      t.float :customers_review_rating, null: false

      t.timestamps
    end
  end
end
