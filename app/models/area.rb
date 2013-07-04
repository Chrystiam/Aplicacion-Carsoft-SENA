class Area < ActiveRecord::Base
  attr_accessible :description, :name
  
	validates :name, :presence => { :message => "Por Favor ingrese un nombre" }, :length => { :maximum => 50, :message => "El nombre ingresado es demasiado lago"}, :uniqueness => { :message => "Este nombre ya ha sido registrado por favor ingrese otro" } 
	validates :description, :presence => { :message => "Por Favor ingrese una descripción" }, :length => { :maximum => 100, :message => "La descripción ingresada es demasiado larga"}, :uniqueness => { :message => "Esta descripción ya ha sido registrada por favor ingrese otra" } 

    def self.search(search)
		where("name like '%#{search}%' or description like '%#{search}%'")
	end
end
