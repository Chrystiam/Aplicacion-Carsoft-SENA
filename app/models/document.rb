class Document < ActiveRecord::Base
  attr_accessible :initials, :name

  has_many :users
  	def self.search(search)
		where("initials like '%#{search}%' or name like '%#{search}%'")
	end
end
