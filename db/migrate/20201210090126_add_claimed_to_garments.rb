class AddClaimedToGarments < ActiveRecord::Migration[5.2]
  def change
    add_column :garments, :claimed, :boolean
  end
end
