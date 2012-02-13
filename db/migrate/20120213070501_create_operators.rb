class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.timestamps
    end
    add_column :operators, :name, :string
    add_column :operators, :connection_type,  :string
    end
  end
