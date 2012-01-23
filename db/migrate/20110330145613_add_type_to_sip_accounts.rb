class AddTypeToSipAccounts < ActiveRecord::Migration
  def self.up
    add_column :sip_accounts, :type, :string
  end

  def self.down
    remove_column :sip_accounts, :type
  end
end