class CreateSavedSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :saved_searches do |t|
      t.integer :user_id
      t.integer :radius
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :price_range
      t.string :cuisine

      t.timestamps
    end
  end
end
