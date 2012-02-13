class AddOperatorToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :operator_id, :integer
  end
end
