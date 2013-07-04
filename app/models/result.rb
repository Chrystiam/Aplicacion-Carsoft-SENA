class Result < ActiveRecord::Base
  belongs_to :answer
  belongs_to :question
  belongs_to :user
  attr_accessible :ok, :answer_id, :question_id, :user_id
  
	
end
