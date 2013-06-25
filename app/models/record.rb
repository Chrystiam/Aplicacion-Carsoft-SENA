 class Record < ActiveRecord::Base
  belongs_to :center
  belongs_to :vehicle
  belongs_to :porter
  belongs_to :material
  belongs_to :user
  belongs_to :team
  attr_accessible :amount, :date, :destination, :movements, :provenance, :time,
  :center_id,  :vehicle_id, :porter_id, :material_id, :user_id, :team_id
  
   
 
	 	def self.search(search)
		where("destination like '%#{search}%' or provenance like '%#{search}%'")
	end

end
 