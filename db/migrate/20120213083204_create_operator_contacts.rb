class CreateOperatorContacts < ActiveRecord::Migration
  def change
    create_table :operator_contacts do |t|

      t.timestamps
    end
    add_column :operator_contacts, :name, :string
    add_column :operator_contacts, :support_mail, :string
    add_column :operator_contacts, :support_phone, :string
    add_column :operator_contacts, :manager_mail, :string
    add_column :operator_contacts, :manager_phone, :string
    add_column :operator_contacts, :our_manager_id, :string
    add_column :operator_contacts, :agreement_id, :string
  end
end
