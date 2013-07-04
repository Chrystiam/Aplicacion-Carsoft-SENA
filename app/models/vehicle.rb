class Vehicle < ActiveRecord::Base
  belongs_to :type_vehicle
  belongs_to :user
  attr_accessible :brand, :color, :model, :plate, :type_vehicle_id, :user_id
  
  	def self.search(search)
		where("brand like '%#{search}%' or color like '%#{search}%' or model like '%#{search}%'  or plate like '%#{search}%'")
	end

	validates :brand, :presence  => { :message => "Por Favor ingrese una marca" } , :length => { :maximum => 30, :message => "la marca ingresada es demasiado larga"}      
	validates :color, :presence  => { :message => "Por Favor ingrese un color" } , :length => { :maximum => 20, :message => "el color ingresado es demasiado largo"}        
	validates :model, :presence  => { :message => "Por Favor ingrese un modelo" }  , :length => { :maximum => 30, :message => "el modelo ingresado es demasiado largo"}        
	validates :plate, :presence  => { :message => "Por Favor ingrese una placa" } , :length => { :maximum => 10, :message => "la placa ingresada es demasiado larga"} ,  :uniqueness  => { :message => "Esta Placa ya ha sido registrada por favor ingrese otra" }               

end
