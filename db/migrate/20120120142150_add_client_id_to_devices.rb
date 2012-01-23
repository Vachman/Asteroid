class AddClientIdToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :client_id, :integer
  end
end