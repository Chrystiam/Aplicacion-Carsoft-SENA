class Document < ActiveRecord::Base
  attr_accessible :initials, :name

 	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"},  :uniqueness  => { :message => "Este nombre ya fue registrado por favor ingrese otro" }         
	validates :initials, :presence  => { :message => "Por Favor ingrese las inciales" } , :length => { :maximum => 20, :message => "las iniciales ingresadas son demasiado largas"},  :uniqueness  => { :message => "Estas inciales ya fueron registradas por favor ingrese otras" }         

  has_many :users
  	def self.search(search)
		where("initials like '%#{search}%' or name like '%#{search}%'")
	end
end
