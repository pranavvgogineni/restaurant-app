class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :city
      t.string :state
      t.integer :zipcode

      t.timestamps
    end
  end
end
