module Cleanup
  
  def cleanup
    
    # We find all questions which have a pertinent date earlier than two weeks ago.
    questions = Question.all.where( "pertinent_date < ?", 2.weeks.ago )
    puts "Cleaning up #{questions.size} questions"
  
    # We loop through the questions ...
    questions.each do |question|
    
      # ...and destroy the record.
      question.destroy
    end
    
    # We find all written statements which have a made date earlier than two weeks ago.
    written_statements = WrittenStatement.all.where( "made_on < ?", 2.weeks.ago )
    puts "Cleaning up #{written_statements.size} written statements"
  
    # We loop through the written statements ...
    written_statements.each do |written_statement|
    
      # ...and destroy the record.
      written_statement.destroy
    end
  end
end