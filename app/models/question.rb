class Question < ApplicationRecord
  
  belongs_to :answering_body
  
  def asking_member
    Member.all.where( "mnis_id = #{self.asking_member_id}" ).first
  end
  
  def answering_member
    Member.all.where( "mnis_id = #{self.answering_member_id}" ).first
  end
  
  def correcting_member
    Member.all.where( "mnis_id = #{self.correcting_member_id}" ).first
  end
  
  # A method to generate hashtags for a question.
  def hashtags
    
    # We create a string to hold the hashtags
    hashtags = ''
  
    # We split the question heading on any colon to get the subjects.
    self.heading.split( ':' ).each do |subject|
      
      # We create a string to hold the subject hastag.
      subject_hashtag = ''
      
      # We split the subject on spaces to tokenise into words.
      subject.split( /[\s,-]/ ).each do |word|
        
        # If the word is longer than one character ...
        if word.length > 1
          
          # Wishing to avoid turning BBC into Bbc.
          # ... unless the second letter of the word is uppercase ...
          unless is_upper?( word[1] )
            
            # ... we capitalise the first letter of the word.
            word.capitalize!
          end
        end
        
        # We remove any hyphens from the word.
        word.gsub!( "'", '' )
        
        # We add the word to the subject hashtag.
        subject_hashtag += word
      end
      
      # We hastag-ify the subject hashtag.
      subject_hashtag = '#' + subject_hashtag
      
      # We add the subject hashtag to the hashtags with a space.
      hashtags += subject_hashtag + ' '
    end
    
    # We return the hashtags.
    hashtags
  end
  
  # A method to check if a character is lowercase.
  def is_lower?( character )
    character >= 'a' && character <= 'z'
  end

  # A method to check if a character is uppercase.
  def is_upper?( character )
    ! is_lower?( character )
  end
  
  def title
    title = ''
    if self.is_correcting_answer
      title += "An earlier answer to a "
    else
      title +=  "A "
    end
    title += "question "
    title += "on #{self.hashtags}" if self.heading
    title += "tabled "
    title += "by #{self.asking_member.display_name} " if self.asking_member
    title += "on #{self.date_tabled.strftime( '%d-%m-%Y' )} has been "
    if self.is_correcting_answer
      title += "corrected "
      title += "by #{self.correcting_member.display_name}." if self.correcting_member
    else
      title +=  "answered "
      title +=  "by #{self.answering_member.display_name}." if self.answering_member
    end
    title
  end
  
  def tweet_text
    tweet_text = ''
    if self.is_correcting_answer
      tweet_text += "An earlier answer to a "
    else
      tweet_text +=  "A "
      end
    tweet_text += "question "
    tweet_text += "on '#{self.heading}' " if self.heading
    tweet_text += "tabled "
    tweet_text += "by #{self.asking_member.twitter_reference} " if self.asking_member
    tweet_text += "on #{self.date_tabled.strftime( '%d-%m-%Y' )} has been "
    if self.is_correcting_answer
      tweet_text += "corrected "
      tweet_text += "by #{self.correcting_member.display_name}. " if self.correcting_member
    else
      tweet_text +=  "answered "
      tweet_text +=  "by #{self.answering_member.display_name}. " if self.answering_member
    end
    tweet_text += "https://questions-statements.parliament.uk/written-questions/detail/#{self.date_tabled}/#{self.uin}"
  end
  
  def safe_tweet_text
    tweet_text = self.title
    tweet_text += ' '
    tweet_text += "https://questions-statements.parliament.uk/written-questions/detail/#{self.date_tabled}/#{self.uin}"
  end
end