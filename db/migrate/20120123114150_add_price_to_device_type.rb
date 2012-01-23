class AddPriceToDeviceType < ActiveRecord::Migration
  def change
    add_column :device_types, :price, :string
  end
end