class ChangeMistake < ActiveRecord::Migration
  def up
    add_column :device_types, :fxs, :integer
  end
  def down
    remove_column :device_types, :fsx
  end
end