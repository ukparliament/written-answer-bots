class Question < ApplicationRecord
  
  def asking_member
    Member.all.where( "mnis_id = #{self.asking_member_id}" ).first
  end
  
  def answering_member
    Member.all.where( "mnis_id = #{self.answering_member_id}" ).first
  end
  
  def correcting_member
    Member.all.where( "mnis_id = #{self.correcting_member_id}" ).first
  end
  
  def tweet_text
    tweet_text = ''

    if self.is_correcting_answer
      tweet_text += "An earlier answer to a "
    else
      tweet_text +=  "A "
    end
    tweet_text += "question on #{self.heading} tabled by #{self.asking_member.twitter_reference} on #{self.date_tabled} has been "
    if self.is_correcting_answer
      tweet_text += "corrected by #{self.correcting_member.twitter_reference}. "
    else
      tweet_text +=  "answered by #{self.answering_member.twitter_reference}. "
    end
    tweet_text += "https://questions-statements.parliament.uk/written-questions/detail/#{self.date_tabled}/#{self.uin}"
  end
end