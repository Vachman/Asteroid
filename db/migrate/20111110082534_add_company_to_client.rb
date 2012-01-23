class AddCompanyToClient < ActiveRecord::Migration
  def change
    add_column :clients, :company, :boolean
  end
end
