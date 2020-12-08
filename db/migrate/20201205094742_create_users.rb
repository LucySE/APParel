class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :email
      t.text :password_digest
      t.text :first_name
      t.text :last_name
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :clothing_size

      t.timestamps
    end
  end
end
