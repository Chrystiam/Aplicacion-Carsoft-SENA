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

end 
