class Destination < ActiveRecord::Base
  attr_accessible :initials, :name

  has_many :destinations
  has_many :usabilities


    def self.search(search)
		where("initials like '%#{search}%' or name like '%#{search}%'")
	end

  	
end
