class Idea < ActiveRecord::Base

  attr_accessible :description

  #VALIDATORS
  validates_presence_of 	:description
  validates_uniqueness_of 	:description

  #RELATIONS
  acts_as_voteable
  acts_as_commentable

  def thumbs_up
  	User.guest.vote_for(self)
  end

  def thumbs_down
  	User.guest.vote_against(self)
  end

end
