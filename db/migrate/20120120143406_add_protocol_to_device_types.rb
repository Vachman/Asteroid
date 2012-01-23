class AddProtocolToDeviceTypes < ActiveRecord::Migration
  def change
    add_column :device_types, :protocol, :string
  end
end