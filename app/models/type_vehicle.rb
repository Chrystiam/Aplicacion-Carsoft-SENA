class TypeVehicle < ActiveRecord::Base
  attr_accessible :description, :name
  
   	def self.search(search)
		where("description like '%#{search}%' or name like '%#{search}%'")
	end

	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este nombre ya fue registrado por favor ingrese otro" }         
	validates :description, :presence  => { :message => "Por Favor ingrese una descripcion" } , :length => { :maximum => 100, :message => "la descripcion ingresada es demasiado larga"} ,  :uniqueness  => { :message => "Esta descripcion ya fue registrada por favor ingrese otra" }         
	
end
