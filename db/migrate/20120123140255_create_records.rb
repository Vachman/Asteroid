class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
        t.string :name
        t.datetime :date
        t.datetime :time
        t.string :called
        t.string :calling
        t.string :link
        t.references :client
        t.timestamps
      end
    end
  end
