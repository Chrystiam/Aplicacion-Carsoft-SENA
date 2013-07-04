class ModifyUser < ActiveRecord::Base
  belongs_to :user
  attr_accessible :change, :description, :user_id
  
  def self.search(search)
		where("change like '%#{search}%' or description like '%#{search}%'")
	end

	validates :change, :presence  => { :message => "Por Favor ingrese los cambios" } , :length => { :maximum => 50, :message => "los cambios ingresados son demasiado largos"}         
	validates :description, :presence  => { :message => "Por Favor ingrese una descripción" }, :length => { :maximum => 100, :message => "la descripción ingresada es demasiado larga"}         

end
