class User < ActiveRecord::Base
  # attr_accessible :title, :body

  # RELATIONS
  acts_as_voter

  def self.guest
  	find_or_create_by_id(1)
  end
end
