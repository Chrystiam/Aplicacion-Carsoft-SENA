class Role < ActiveRecord::Base
    has_many :assignments
    has_many :users, :through => :assignments
  attr_accessible :acronym, :name
  	def self.search(search)
		where("acronym like '%#{search}%' or name like '%#{search}%'")
	end

	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"},  :uniqueness  => { :message => "Este nombre ya fue registrado por favor ingrese otro" }         
	validates :acronym, :presence  => { :message => "Por Favor ingrese un acronimo" } , :length => { :maximum => 20, :message => "el acronimo ingresado es demasiado largo"},  :uniqueness  => { :message => "Este acronimo ya fue registrado por favor ingrese otro" }                

end
