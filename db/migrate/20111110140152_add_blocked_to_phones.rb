class AddBlockedToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :blocked, :boolean
  end
end
