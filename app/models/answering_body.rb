# == Schema Information
#
# Table name: answering_bodies
#
#  id      :integer          not null, primary key
#  name    :string(255)      not null
#  mnis_id :integer          not null
#
class AnsweringBody < ApplicationRecord
  
  has_many :questions,
    -> { order( 'questions.pertinent_date desc' ) }
    
  def untweeted_answers
    Question.all.where( 'answering_body_id = ?', self.id ).where( 'tweeted is false' )
  end
end



