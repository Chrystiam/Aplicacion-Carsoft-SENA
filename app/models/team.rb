class Team < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :porter
  belongs_to :user
  has_many :categories
  attr_accessible :color, :accessory, :name, :serial, :type_team, :porter_id, :user_id,
  :type_material_id

  validates :color, :presence  => { :message => "Por Favor ingrese un color" }, :length => { :maximum => 30, :message => "el color ingresado es demasiado largo"}         
	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" }, :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"}         
	validates :serial, :presence  => { :message => "Por Favor ingrese un serial" }, :length => { :maximum => 50, :message => "el serial ingresado es demasiado largo"}         
	
  def self.search(search)
		where("color  like '%#{search}%' or name like '%#{search}%' or serial like '%#{search}%'")
	end
end 
