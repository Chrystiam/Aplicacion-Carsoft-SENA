class Parking < ActiveRecord::Base
  belongs_to :area
  belongs_to :vehicle
  attr_accessible :description, :location, :space_avaible, :area_id, :vehicle_id
  
  	def self.search(search)
		where("description like '%#{search}%' or location like '%#{search}%' or space_avaible like '%#{search}%'")
	end
end
  