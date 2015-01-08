class Assignment < ActiveRecord::Base
  has_many :question_assignments
  after_create :set_questions_answered

  def set_questions_answered
    questions.update_all(:answer => 42)
  end
end

class Page < Assignment
  has_many :questions, :through => :question_assignments
end

class Question < ActiveRecord::Base
  has_many :line_item_submissions
end

class QuestionAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :question
end
