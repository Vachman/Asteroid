class ChangeTypeInSipAccounts < ActiveRecord::Migration
  def self.up
    rename_column :sip_accounts, :type, :account_type
  end

  def self.down
    rename_column :sip_accounts, :account_type, :type
  end
end