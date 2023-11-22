class AddAddressToRestaurant < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :address, :string
  end
end
