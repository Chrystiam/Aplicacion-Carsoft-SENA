class FormatSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  belongs_to :answer
  belongs_to :question
  attr_accessible :name, :user_id, :survey_id, :answer_id, :question_id
end
