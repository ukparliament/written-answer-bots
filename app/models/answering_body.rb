class AnsweringBody < ApplicationRecord
  
  has_many :questions,
    -> { order( 'questions.date_answer_corrected desc, questions.date_answered desc' ).limit( 20 ) }
end



