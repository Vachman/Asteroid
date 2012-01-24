class Record < ActiveRecord::Base
  belongs_to :phone
  belongs_to :client
  
end
