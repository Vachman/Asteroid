class RenameCallLimitInSipAccounts < ActiveRecord::Migration
  def self.up
    rename_column :sip_accounts, 'call-limit', :call_limit
  end

  def self.down
    rename_column :sip_accounts, :call_limit, 'call-limit'
  end
end