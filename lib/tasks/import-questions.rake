require 'net/http'
   


task :import_questions => :environment do
  puts "importing questions with answers"
  
  source = 'https://writtenquestions-api.parliament.uk/api/writtenquestions/questions?answeredWhenFrom=2022-01-01&take=1000'
  response = Net::HTTP.get_response( URI.parse( source ) )
  data = response.body
  json = JSON.parse( data )
  
  json['results'].each do |question|
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
    
    question = Question.all.where( "date_tabled = '#{date_tabled.to_s}'" ).where( "uin = '#{uin.to_s}'" ).first
    unless question
      question = Question.new
      question.tweeted = false
    end
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
    question.answering_body_id = answering_body_id
    question.answering_body_name = answering_body_name
    question.save   
  end
end


