# encoding: utf-8
class SipAccount < ActiveRecord::Base
  belongs_to :client
  has_many :bind_sip_accounts
  has_many :phones, :through => :bind_sip_accounts
  belongs_to :phone # For CallerID

  def available?
   self.lastms.to_i == 0 || self.lastms.to_i > 2000  ? false : true
  end
  
  def turn_on
    self.update_attributes(:permit => "89.255.64.0/19")
  end
  
  def turn_off
    self.update_attributes( :permit =>  '' )
  end
  
  def turn_on?
    self.permit != '' ? true : false
  end
  
  def locked?
    self.context.include?('_block') ? true : false
  end
  
  def phone_number
    self.phone.number
  end
  
  def status_tag
    case self.status
       when 'Доступен' then :ok
       when 'Недоступен' then :warning
       when 'Выключен' then :error
    end
  end
  
  def status
    if not self.turn_on?
      "Выключен"   
    elsif self.turn_on? and not self.available?
      "Недоступен"
    else
      "Доступен"
    end 
  end
  
  scope :available,   where("permit != '' AND lastms > 0 AND lastms < 2000")
  scope :unavailable, where("(lastms = 0 OR lastms > 2000 OR lastms = '') AND permit != ''")
  scope :turned_off,  where("permit = ''")
      
end
