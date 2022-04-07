class AnsweringBody < ApplicationRecord
  
  has_many :questions,
    -> { order( 'questions.pertinent_date desc' ).limit( 20 ) }
    
  def untweeted_answers
    Question.all.where( 'answering_body_id = ?', self.id ).where( 'tweeted is false' )
  end
end



