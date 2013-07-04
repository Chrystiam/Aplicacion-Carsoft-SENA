class Parking < ActiveRecord::Base
  belongs_to :area
  belongs_to :vehicle
  attr_accessible :description, :location, :space_avaible, :area_id, :vehicle_id
  
  	def self.search(search)
		where("description like '%#{search}%' or location like '%#{search}%' or space_avaible like '%#{search}%'")
	end

	validates :description, :presence  => { :message => "Por Favor ingrese una descripción" }  , :length => { :maximum => 100, :message => "la descripción ingresada es demasiado larga"}       
 	validates :location, :presence  => { :message => "Por Favor ingrese una localización" }  , :length => { :maximum => 50, :message => "la localización ingresada es demasiado larga"}       
	validates :space_avaible, :presence  => { :message => "Por Favor ingrese el espacio disponible" } 	, :length => { :maximum => 30, :message => "el espacio ingresado es demasiado largo"}        
      

end
  