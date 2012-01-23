class AddCommonColumnsToDeviceTypes < ActiveRecord::Migration
  def change
    add_column :device_types, :fsx, :integer
    add_column :device_types, :fxo, :integer
    add_column :device_types, :lan, :integer
    add_column :device_types, :wifi, :boolean
    add_column :device_types, :protocol, :string
  end
end