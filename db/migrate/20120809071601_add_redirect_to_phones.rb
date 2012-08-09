class AddRedirectToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :redirect_number, :string
    add_column :phones, :redirection, :boolean
  end
end
