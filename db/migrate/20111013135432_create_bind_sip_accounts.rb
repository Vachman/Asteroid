class CreateBindSipAccounts < ActiveRecord::Migration
  def self.up
    create_table :bind_sip_accounts do |t|
      t.integer :phone_id
      t.integer :sip_account_id

      t.timestamps
    end
  end

  def self.down
    drop_table :bind_sip_accounts
  end
end
