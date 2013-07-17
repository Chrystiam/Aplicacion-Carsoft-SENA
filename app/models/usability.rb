class Usability < ActiveRecord::Base
  attr_accessible :initials, :name
    

  	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 20, :message => "el nombre ingresado es demasiado largo"}       
	validates :initials, :presence  => { :message => "Por Favor ingrese unas iniciales" } , :length => { :maximum => 20, :message => "las iniciales ingresadas es demasiado larga"}      

   def self.search(search)
		where("initials like '%#{search}%' or name like '%#{search}%'")
	end
end