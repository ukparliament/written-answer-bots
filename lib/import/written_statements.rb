require 'net/http'
require 'open-uri'

module Import
  module WrittenStatements
  
    def import_written_statements
      
      # We set the from date to yesterday.
      from_date = Date.yesterday - 5.days
    
      # We construct the source URL ...
      source = "https://questions-statements-api.parliament.uk/api/writtenstatements/statements?madeWhenFrom=#{from_date}&take=100"
      
      # ... and get the body of the response as JSON.
      response = Net::HTTP.get_response( URI.parse( source ) )
      data = response.body
      json = JSON.parse( data )
      
      # For each result ...
      json['results'].each do |written_statement|
        
        # ... we store the values we're interested in.
        member_mnis_id = written_statement['value']['memberId']
        member_role = written_statement['value']['memberRole']
        uin = written_statement['value']['uin']
        made_on = written_statement['value']['dateMade'].to_date
        answering_body_mnis_id = written_statement['value']['answeringBodyId']
        title = written_statement['value']['title']
        house = written_statement['value']['house']
        
        # We find the Member.
        member = Member.find_by_mnis_id( member_mnis_id )
        
        # We find the answering body.
        answering_body = AnsweringBody.find_by_mnis_id( answering_body_mnis_id )
        
        # We check if we've already imported this written statement.
        written_statement = WrittenStatement.all.where( "made_on = ?", made_on ).where( "uin = ?", uin ).first
        
        # Unless we've already imported this written statement ...
        unless written_statement
          
          # ... we create the written statement.
          written_statement = WrittenStatement.new
          written_statement.made_on = made_on
          written_statement.uin = uin
          written_statement.title = title
          written_statement.house_name = house
          written_statement.member_role = member_role
          written_statement.member = member
          written_statement.answering_body = answering_body
          written_statement.save!
        end
      end
    end
  end
end