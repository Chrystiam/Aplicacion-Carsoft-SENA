class TypeUser < ActiveRecord::Base
  attr_accessible :acronym, :description, :name
  	def self.search(search)
		where("acronym like '%#{search}%' or description like '%#{search}%' or name like '%#{search}%'")
	end

	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"},  :uniqueness  => { :message => "Este nombre ya fue registrado por favor ingrese otro" }     
	validates :acronym, :presence  => { :message => "Por Favor ingrese un acronimo" } , :length => { :maximum => 30, :message => "el acronimo ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este acronimo ya fue registrado por favor ingrese otro" }         
	validates :description, :presence  => { :message => "Por Favor ingrese una descripción" } , :length => { :maximum => 100, :message => "la descripción ingresada es demasiado larga"} ,  :uniqueness  => { :message => "Esta descripcion ya fue registrada por favor ingrese otra" }         

end
