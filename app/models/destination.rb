class Destination < ActiveRecord::Base
  attr_accessible :initials, :name

  	validates :name, :presence  => { :message => "Por Favor ingrese un nombre"  }, :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"},     
	validates :initials, :presence  => { :message => "Por Favor ingrese las inciales" }, :length => { :maximum => 20, :message => "las inciales ingresadas son demasiado largas"},         

end
