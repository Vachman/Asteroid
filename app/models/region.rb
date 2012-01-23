class Region < ActiveRecord::Base
  belongs_to :direction
  has_many :phone_codes
end
