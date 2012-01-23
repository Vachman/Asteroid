# encoding: utf-8
class DeviceType < ActiveRecord::Base
  has_many :devices
  
  def avaliable
    self.devices.where('client_id is ?',nil).count
  end
  
end
