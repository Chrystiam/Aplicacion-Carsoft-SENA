class AreaCenter < ActiveRecord::Base
  has_many :centers
  belongs_to :responsible
  attr_accessible :extension, :name, :phone, :specification, :center_id,  :responsible_id
end
 