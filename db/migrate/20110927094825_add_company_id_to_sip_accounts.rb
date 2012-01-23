class AddCompanyIdToSipAccounts < ActiveRecord::Migration
  def self.up
    add_column :sip_accounts, :company_id, :integer
  end

  def self.down
    remove_column :sip_accounts, :company_id
  end
end
