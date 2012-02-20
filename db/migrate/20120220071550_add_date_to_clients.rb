class AddDateToClients < ActiveRecord::Migration
  def change
    add_column :clients, :date_ot_inclusion, :datetime
    add_column :clients, :off_date, :datetime
  end
end
