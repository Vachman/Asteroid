class AddAlotToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :timeout, :string
    add_column :phones, :congestion, :boolean
    add_column :phones, :noanswer, :boolean
    add_column :phones, :busy, :boolean
    add_column :phones, :chanunavail, :boolean
  end
end
