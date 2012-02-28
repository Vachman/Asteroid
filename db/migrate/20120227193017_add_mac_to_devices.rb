class AddMacToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :mac, :string
  end
end
