class Device < ActiveRecord::Base
  belongs_to :device_type
  belongs_to :client
  
  
  def avaliable
    self.name
  end
end
