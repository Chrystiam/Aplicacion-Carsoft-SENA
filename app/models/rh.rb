class Rh < ActiveRecord::Base
  has_many :users
  attr_accessible :name
     def self.search(search)
		where("name like '%#{search}%' ")
	end

	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 10, :message => "el nombre ingresado es demasiado largo"},  :uniqueness  => { :message => "Este nombre ya fue registrado por favor ingrese otro" }         
     
end
