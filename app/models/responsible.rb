class Responsible < ActiveRecord::Base
  belongs_to :document
  has_many :area_centers
  has_many :users
  attr_accessible :extension, :genre, :identification, :name, :phone, :surname, :document_id


  def self.responsible_ubicacion(responsible,area_center)
  	@ubicacion = responsible + " | " + area_center.name  + " | " +   area_center.center.name
  end

  def self.search(search)
    where("extension like '%#{search}%' or identification like '%#{search}%' or name like '%#{search}%'
    or phone like '%#{search}%' or surname like '%#{search}%' ")
  end

  validates :extension, :presence  => { :message => "Por Favor ingrese una extensión" } , :length => { :maximum => 20, :message => "la extensión ingresada es demasiado larga"}        
	validates :identification, :presence  => { :message => "Por Favor ingrese una identificación" } ,  :uniqueness  => { :message => "Esta identificacionya fue registrada por favor elija otra " }         
	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"}         
	validates :phone, :presence  => { :message => "Por Favor ingrese un telefono" } , :length => { :maximum => 30, :message => "el telefono ingresado es demasiado largo"}         
	validates :surname, :presence  => { :message => "Por Favor ingrese una apellido" }  , :length => { :maximum => 50, :message => "el apellido ingresado es demasiado largo"}            

end
