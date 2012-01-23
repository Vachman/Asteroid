class CreateSipAccounts < ActiveRecord::Migration
  def self.up
    create_table :sip_accounts do |t|
      t.string :name, :null => false
      t.string :username, :null => false
      t.string :context, :null => false
      t.string :secret, :null => false 
      t.string :host, :null => false, :default => "dynamic"
      t.string :disallow, :default => "all"
      t.string :allow, :default => "ulaw;alaw;g729;ilbc;gsm"
      t.string :deny, :default => "0.0.0.0/0.0.0.0"
      t.string :permit, :default => "89.255.64.0/24;89.255.65.0/24;89.255.66.0/24;89.255.67.0/24;89.255.68.0/24"
      t.string :nat, :null => false, :default => "yes"
      t.string :qualify, :null => false, :default => "yes"
      t.string :type, :null => false, :default => "friend"
      t.string :t38pt_udptl, :null => false, :default => "no"
      t.string :callgroup
      t.integer 'call-limit', :default => '1' 
      t.string :canreinvite, :default => 'yes' 
      t.string :dtmfmode, :default => 'auto' 
      t.string :ipaddr, :null => false, :default => '' 
      t.string :mailbox
      t.string :pickupgroup
      t.string :port, :null => false, :default => '' 
      t.string :regexten, :null => false, :default => '' 
      t.integer :regseconds, :null => false, :default => '0' 
      t.string :useclientcode, :default => 'no' 
      t.string :fullcontact
      t.string :lastms
      t.string :useragent
      t.string :regserver
    
      t.timestamps
    end
    add_index :sip_accounts, [:name], :unique => true
  end

  def self.down
    rename_column :table_name, :new_column_name, :column_name
    remove_index :sip_accounts, :column => [:name]
    drop_table :sip_accounts
  end
end