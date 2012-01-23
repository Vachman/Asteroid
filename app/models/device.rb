class Device < ActiveRecord::Base
  belongs_to :device_type
  belongs_to :client
  has_many :phones, :through => :clients
  
  
  def model
    self.device_type.name
  end

  scope :avaliable,   where('client_id is ?', nil)
  scope :unavaliable,  where("client_id != 'NULL'")
  
end
