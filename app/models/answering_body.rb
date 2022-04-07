class AnsweringBody < ApplicationRecord
  
  has_many :questions,
    -> { order( 'questions.pertinent_date desc' ).limit( 20 ) }
end



