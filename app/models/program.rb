class Program < ActiveRecord::Base
  attr_accessible :name, :code, :user_id
  belongs_to :user
   	def self.search(search)
		where("name like '%#{search}%' or code like '%#{search}%'")
	end

 	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este nombre ya fue registrado por favor ingrese otro" }         
	validates :code, :presence  => { :message => "Por Favor ingrese un codigo" } , :length => { :maximum => 20, :message => "el codigo ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este codigo ya fue registrado por favor ingrese otro" }         

end
