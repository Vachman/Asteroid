class AddManyToOperator < ActiveRecord::Migration
  def change
    add_column :operators, :agreement_id, :integer
    add_column :operators, :our_manager, :integer
    add_column :operators, :their_manager, :integer
    add_column :operators, :support_phone, :string
    add_column :operators, :support_mail, :string
    add_column :operators, :sales_phone, :string
    add_column :operators, :sales_mail, :string
    
    add_column :phones, :ordered, :tinyint
    add_column :phones, :reserved, :integer
  end
end
