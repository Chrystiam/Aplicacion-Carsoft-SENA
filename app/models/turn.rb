class Turn < ActiveRecord::Base
  attr_accessible :day,  :start_time, :finish_time, :start_date, :finish_date
    def self.search(search)
		where("day like '%#{search}%' ")
	end

	validates :day, :presence  => { :message => "Por Favor ingrese la fecha del registro" }         
	validates :start_date, :presence  => { :message => "Por Favor la fecha de inicio" }         
	validates :finish_time, :presence  => { :message => "Por Favor la fecha de terminación" } 
	validates :start_date, :presence  => { :message => "Por Favor la fecha de inicio" }         
	validates :finish_date, :presence  => { :message => "Por Favor la fecha de terminación" }         
     
end
