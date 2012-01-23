class BindSipAccount < ActiveRecord::Base
  belongs_to :sip_account
  belongs_to :phone
end
