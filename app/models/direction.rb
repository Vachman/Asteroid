# encoding: utf-8
class Direction < ActiveRecord::Base
  has_many :regions
  
  def page_title
    "Направления"
  end
end
