class TypeMaterial < ActiveRecord::Base
  attr_accessible :description, :name

  	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este nombre ya fue registrada por favor ingrese otro" }         
	validates :description, :presence  => { :message => "Por Favor ingrese una descripción" } , :length => { :maximum => 100, :message => "la descripción ingresado es demasiada larga"} ,  :uniqueness  => { :message => "Esta descripcion ya fue registrada por favor ingrese otra" }              

  
  def self.search(search)
		where("description like '%#{search}%' or name like '%#{search}%'")
	end
end
