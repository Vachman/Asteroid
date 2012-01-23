class RemoveTypeFromSipAccounts < ActiveRecord::Migration
  def self.up
    remove_column :sip_accounts, :type
  end

  def self.down
    add_column :sip_accounts, :type, :string,          :default => "friend",                                                                     :null => false
  end
end
