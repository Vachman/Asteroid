class CreatePhoneCodes < ActiveRecord::Migration
  def self.up
    create_table :phone_codes do |t|
      t.string :coe
      t.integer :region_id

      t.timestamps
    end
  end

  def self.down
    drop_table :phone_codes
  end
end
