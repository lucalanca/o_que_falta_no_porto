class Idea < ActiveRecord::Base

  attr_accessible :description

  #VALIDATORS
  validates_presence_of 	:description
  validates_uniqueness_of 	:description
end
