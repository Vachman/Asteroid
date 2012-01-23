class ChangePrioriryOnContextRules < ActiveRecord::Migration
  def self.up
    change_column :context_rules, :priority, :string
  end

  def self.down
    change_column :context_rules, :priority, :string
  end
end