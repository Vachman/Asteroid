class CreateContextRules < ActiveRecord::Migration
  def self.up
    create_table :context_rules do |t|
      t.references :context
      t.string :exten
      t.integer :priority
      t.string :app
      t.string :appdata

      t.timestamps
    end
  end

  def self.down
    drop_table :context_rules
  end
end
