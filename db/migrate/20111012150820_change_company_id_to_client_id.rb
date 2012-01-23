class ChangeCompanyIdToClientId < ActiveRecord::Migration
  def self.up
    rename_column :sip_accounts, :company_id, :client_id
  end

  def self.down
    rename_column :sip_accounts, :client_id, :company_id
  end
end