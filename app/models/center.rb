class Center < ActiveRecord::Base
  belongs_to :area_center
  has_many :users
  attr_accessible :name, :code, :area_center_id
  
  def self.search(search)
		where("name like '%#{search}%' ")
  end

  def self.center_ubicacion(center,area_center)
  	@ubicacion = center + " | " + area_center.name  + " | " +   area_center.responsible.name
  end

  validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"},   :uniqueness  => { :message => "Este nombre ya fue registrado por favor ingrese otro" }        
	validates :code, :presence  => { :message => "Por Favor ingrese un codigo" } , :length => { :maximum => 30, :message => "el codigo ingresado es demasiado largo"},  :uniqueness  => { :message => "Este codigo ya fue registrado por favor ingrese otro" }         

end 
