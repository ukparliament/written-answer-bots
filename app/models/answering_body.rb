class AnsweringBody < ApplicationRecord
  
  has_many :questions, -> { limit( 20 ) }
end
