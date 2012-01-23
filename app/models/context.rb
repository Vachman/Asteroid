class Context < ActiveRecord::Base
  has_many :context_rules
  
  validates_presence_of :name, :message => "can't be blank"
end
