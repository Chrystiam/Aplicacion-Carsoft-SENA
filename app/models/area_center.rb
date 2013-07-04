class AreaCenter < ActiveRecord::Base
  has_many :centers
  belongs_to :responsible
  attr_accessible :extension, :name, :phone, :specification, :center_id,  :responsible_id

  	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"},  :uniqueness  => { :message => "Esta extension ya fue registrada por favor ingrese otra" }         
	validates :extension, :presence  => { :message => "Por Favor ingrese una extensión" , :length => { :maximum => 20, :message => "la extensión ingresada es demasiado larga"},}       
	validates :phone, :presence  => { :message => "Por Favor ingrese un telefono" } , :length => { :maximum => 30, :message => "el telefono ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este telefono ya fue registrado por favor ingrese otro" }         
	validates :specification, :presence  => { :message => "Por Favor ingrese una especificación", :length => { :maximum => 100, :message => "la especificación ingresada es demasiado larga"} }         
         
end
 