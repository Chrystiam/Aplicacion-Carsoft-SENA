class Suggestion < ActiveRecord::Base
  belongs_to :document
  belongs_to :user
  attr_accessible :movil, :name, :number_identification,
  :phone, :suggestion, :surname, :document_id

	validates :name, :presence  => { :message => "Por Favor ingrese un nombre" }, :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"}         
	validates :number_identification, :presence  => { :message => "Por Favor ingrese un numero de documento" } , :length => { :maximum => 20, :message => "el numero de documento ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este numero de documento ya fue registrado por favor ingrese otro" }         
	validates :suggestion, :presence  => { :message => "Por Favor ingrese una sugerencia" }, :length => { :maximum => 100, :message => "la sugerencia ingresada es demasiado larga"}         

  def self.search(search)
		where("name like '%#{search}%' or number_identification like '%#{search}%'
			or phone like '%#{search}%' or surname like '%#{search}%' or movil like '%#{search}%'")
  end
end
  