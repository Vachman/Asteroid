class Phone < ActiveRecord::Base
  belongs_to :client
  belongs_to :operator
  has_many :bind_sip_accounts
  has_many :sip_accounts, :through => :bind_sip_accounts
  has_many :with_this_aon_sip_accounts, :class_name => "SipAccount", :foreign_key => "phone_id"
  
  validates_presence_of :number, :message => "can't be blank"
  validates_uniqueness_of :number, :message => "must be unique"
  validates_length_of :number, :is => 10, :message => "must be 10 characters"
  validates_numericality_of :number, :message => "is not a number"
  
  
  scope :blocked, where('blocked = true')
  scope :active, where("blocked = false OR blocked = '' ")
  scope :ordered, where('ordered = true')
  scope :notordered, where("ordered = false OR ordered = '' ")
end
