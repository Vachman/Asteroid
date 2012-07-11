class AddAccountCodeToSipAccounts < ActiveRecord::Migration
  def change
    add_column :sip_accounts, :accountcode, :string
  end
end
