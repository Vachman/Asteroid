# encoding: utf-8
class DeviceType < ActiveRecord::Base
  has_many :devices
  
  def avaliable
    self.devices.where('client_id is ?',nil).count
  end
  def unavaliable
    self.devices.where("client_id != 'NULL'").count
  end
end
