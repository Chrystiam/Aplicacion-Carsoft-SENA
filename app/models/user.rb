class User < ActiveRecord::Base

  authenticates_with_sorcery! 
  
  has_many :assignments
  has_many :roles, :through => :assignments
  has_many :vehicle
  has_many :team
  has_many :material
  has_many :modify_user
  has_many :suggestion

  
  attr_accessible :email, :password, :password_confirmation
  attr_accessible :address_residence, :gender, :avatar
  attr_accessible :identification, :movil, :name, :phone, :avatar_file_name
  attr_accessible :document_id, :rh_id, :role_ids, :type_user_id, :role_id
  

  belongs_to :document
  belongs_to :rh
  belongs_to :role_id
  belongs_to :type_user

  belongs_to :center
  attr_accessible :center_name



  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  } 


  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :name, :phone
  validates_uniqueness_of :email

  validates :address_residence, :presence  => { :message => "Por Favor ingrese una direccion" } , :length => { :maximum => 50, :message => "la direccion ingresada es demasiado larga"}            
  validates :identification, :presence  => { :message => "Por Favor ingrese el numero de identificación" } , :length => { :maximum => 20, :message => "el numero de identificación ingresado es demasiado largo"} ,  :uniqueness  => { :message => "Este numero de identificacion ya fue registrado por favor ingrese otro" }         
  validates :name, :presence  => { :message => "Por Favor ingrese un nombre" } , :length => { :maximum => 50, :message => "el nombre ingresado es demasiado largo"}


  
  
  def center_name
    center.name if center
  end

  def  center_nombre=(nombre)
    self.center = Center.find_or_create_by_nombre(name)  unless name.blank? 
  end

  def self.search(search)
		where("name like '%#{search}%' or identification like '%#{search}%' or address_residence like '%#{search}%'
    or phone like '%#{search}%' or movil like '%#{search}%' ")
	end

  def has_role?(role_sym)
       roles.any? { |r| r.name.underscore.to_sym == role_sym }
    end

end

