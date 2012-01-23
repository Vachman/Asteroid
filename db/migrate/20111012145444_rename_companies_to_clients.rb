class RenameCompaniesToClients < ActiveRecord::Migration
  def self.up
    rename_table :companies, :clients
  end

  def self.down
    rename_table :clients, :companies
  end
end