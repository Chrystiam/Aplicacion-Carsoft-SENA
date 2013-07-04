class Authorization < ActiveRecord::Base
  belongs_to :destination
  belongs_to :user
  belongs_to :usability
  
  attr_accessible :acceptance, :avatar, :user_id, :destination_id, :usability_id,  :avatar
  attr_accessible :element1, :element2, :element3, :element4, :sum1, :sum2, :sum3, :sum4, :date
  
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

end
