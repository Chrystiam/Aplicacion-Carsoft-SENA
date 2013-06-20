class Suggestion < ActiveRecord::Base
  belongs_to :document
  belongs_to :user
  attr_accessible :movil, :name, :number_identification,
  :phone, :suggestion, :surname, :document_id

  def self.search(search)
		where("name like '%#{search}%' or number_identification like '%#{search}%'
			or phone like '%#{search}%' or surname like '%#{search}%' or movil like '%#{search}%'")
  end
end
  