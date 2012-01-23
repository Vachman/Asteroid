class Device < ActiveRecord::Base
  belongs_to :device_type
  belongs_to :client
  
  
  def model
    self.device_type.name
  end
end
