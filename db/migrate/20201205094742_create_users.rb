class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name
      t.text :address_text
      t.integer :clothing_size

      t.timestamps
    end
  end
end
