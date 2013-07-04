class Porter < ActiveRecord::Base
  belongs_to :turn
  attr_accessible  :name, :surname, :address, :phone,  :turn_id, :avatar

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  
  def self.search(search)
		where("name like '%#{search}%' or surname like '%#{search}%' or address like '%#{search}%' or phone like '%#{search}%'")
	end

  validates :name, :presence  => { :message => "Por Favor ingrese un nombre" }  , :length => { :maximum => 100, :message => "el nombre ingresado es demasiado largo"}      
  validates :surname, :presence  => { :message => "Por Favor ingrese un apellido" }   , :length => { :maximum => 100, :message => "el nombre ingresado es demasiado largo"}
  validates :address, :presence  => { :message => "Por Favor ingrese una dirección" }  , :length => { :maximum => 100, :message => "el nombre ingresado es demasiado largo"}
  validates :phone, :presence  => { :message => "Por Favor ingrese un telefono" }   , :length => { :maximum => 100, :message => "el nombre ingresado es demasiado largo"}
end
