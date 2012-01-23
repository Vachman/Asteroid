class Client < ActiveRecord::Base
  has_many :sip_accounts
  has_many :phones
  has_many :devices
  
  scope :companies, where('company = true')
  scope :people, where('company = false')
  
end
