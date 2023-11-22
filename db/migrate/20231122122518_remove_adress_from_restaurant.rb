class RemoveAdressFromRestaurant < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :adress, :string
  end
end
