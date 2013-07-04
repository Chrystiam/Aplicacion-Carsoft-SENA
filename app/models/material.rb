class Material < ActiveRecord::Base
  belongs_to :type_material
  belongs_to :user
  attr_accessible :description, :name, :type_material_id, :user_id

  	validates :description, :presence  => { :message => "Por Favor ingrese una descripción" } , :length => { :maximum => 100, :message => "la descripción ingresado es demasiado largo"}        
	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" }, :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"} 

  def self.search(search)
		where("description like '%#{search}%' or name like '%#{search}%'")
	end
end
 