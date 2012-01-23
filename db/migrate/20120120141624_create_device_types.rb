class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string :name
      t.boolean :router
      
      t.timestamps
    end
  end
end
