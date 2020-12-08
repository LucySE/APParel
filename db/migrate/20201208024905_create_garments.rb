class CreateGarments < ActiveRecord::Migration[5.2]
  def change
    create_table :garments do |t|
      t.string :title
      t.text :garment_type
      t.integer :size
      t.integer :points
      t.integer :user_id
      t.text    :description
      t.timestamps
    end
  end
end
