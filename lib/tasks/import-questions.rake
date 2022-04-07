require 'net/http'
   


task :import_questions => :environment do
  puts "importing questions with answers"
  
  # We set the from date to yesterday.
  from_date = Date.yesterday
  
  # We construct the source URL.
  source = "https://writtenquestions-api.parliament.uk/api/writtenquestions/questions?answeredWhenFrom=#{from_date}&take=100"
  response = Net::HTTP.get_response( URI.parse( source ) )
  data = response.body
  json = JSON.parse( data )
  
  # We loop through each question returned ...
  json['results'].each do |question|
    
    # ... and extract all values.
    question_id = question['value']['id']
    asking_member_id = question['value']['askingMemberId']
    house = question['value']['house']
    member_interest = question['value']['memberHasInterest']
    date_tabled = question['value']['dateTabled'].to_date
    date_for_answer = question['value']['dateForAnswer'].to_date
    uin = question['value']['uin']
    question_text = question['value']['questionText']
    is_named_day = question['value']['isNamedDay']
    is_holding_answer = question['value']['answerIsHolding']
    is_correcting_answer = question['value']['answerIsCorrection']
    answering_member_id = question['value']['answeringMemberId']
    correcting_member_id = question['value']['correctingMemberId']
    date_answered = question['value']['dateAnswered'].to_date
    answer_text = question['value']['answerText']
    original_answer_text = question['value']['originalAnswerText']
    comparable_answer_text = question['value']['comparableAnswerText']
    date_answer_corrected = question['value']['dateAnswerCorrected'].to_date if question['value']['dateAnswerCorrected']
    date_answer_holding = question['value']['dateHoldingAnswer'].to_date if question['value']['dateHoldingAnswer']
    heading = question['value']['heading']
    answering_body_id = question['value']['answeringBodyId']
    answering_body_name = question['value']['answeringBodyName']
    
    # We find the answering body.
    answering_body = AnsweringBody.find_by_mnis_id( answering_body_id )
    
    # If the answering body is not found ...
    unless answering_body
      
      # ... we create a new answering body
      answering_body = AnsweringBody.new
      answering_body.mnis_id = answering_body_id
      answering_body.name = answering_body_name
      answering_body.save
    end
    
    # If the answer is not a holding answer ....
    if is_holding_answer == false
      
      # If the answer is a correction ...
      if is_correcting_answer
        
        # ... we check if there's an existing question with the same date tabled, uin and date_answer_corrected ...
        question = Question
          .all
          .where( "date_tabled = '#{date_tabled.to_s}'" )
          .where( "uin = '#{uin.to_s}'" )
          .where( "date_answer_corrected = '#{date_answer_corrected.to_s}'" )
          .first
          
        # ... and we set the pertinent date to the date the answer was corrected.
        pertinent_date = date_answer_corrected
          
      # Otherwise, if the answer is not a correction ...
      else
        
        # ... we check if there's an existing question with the same date tabled and uin ...
        question = Question
          .all
          .where( "date_tabled = '#{date_tabled.to_s}'" )
          .where( "uin = '#{uin.to_s}'" )
          .first
          
        # ... and we set the pertinent date to the date the question was answered.
        pertinent_date = date_answered
      end
      
      # If this particular answer to the question has not been captured ...
      unless question
        
        # We create a new question / answer ...
        question = Question.new
        
        # ... and set its tweeted status to false.
        question.tweeted = false
      end
      
      # We set or reset the attribute of the answer to the question.
      question.question_id = question_id
      question.asking_member_id = asking_member_id
      question.house = house
      question.member_interest = member_interest
      question.date_tabled = date_tabled
      question.uin = uin
      question.question_text = question_text
      question.is_named_day = is_named_day
      question.is_holding_answer = is_holding_answer
      question.is_correcting_answer = is_correcting_answer
      question.answering_member_id = answering_member_id
      question.correcting_member_id = correcting_member_id
      question.date_answered = date_answered
      question.answer_text = answer_text
      question.original_answer_text = original_answer_text
      question.comparable_answer_text = comparable_answer_text
      question.date_answer_corrected = date_answer_corrected
      question.date_answer_holding = date_answer_holding
      question.heading = heading
      question.answering_body = answering_body
      question.pertinent_date = pertinent_date
      question.save
      
    # Otherwise, if the answer is a holding answer ....
    else
      
      # ... we do nothing.
    end
  end
end


