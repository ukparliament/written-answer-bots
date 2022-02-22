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
  
  def tweet_text
    tweet_text = ''

    if self.is_correcting_answer
      tweet_text += "An earlier answer to a "
    else
      tweet_text +=  "A "
      end
    tweet_text += "question "
    tweet_text += "on #{self.heading} " if self.heading
    tweet_text += "tabled by #{self.asking_member.twitter_reference} on #{self.date_tabled.strftime( '%d-%m-%Y' )} has been "
    if self.is_correcting_answer
      tweet_text += "corrected by #{self.correcting_member.twitter_reference}. "
    else
      tweet_text +=  "answered by #{self.answering_member.twitter_reference}. "
    end
    tweet_text += "https://questions-statements.parliament.uk/written-questions/detail/#{self.date_tabled}/#{self.uin}"
  end
  
  def safe_tweet_text
    tweet_text = ''

    if self.is_correcting_answer
      tweet_text += "An earlier answer to a "
    else
      tweet_text +=  "A "
    end
    tweet_text += "question "
    tweet_text += "on #{self.heading} " if self.heading
    tweet_text += "tabled by #{self.asking_member.safe_twitter_reference} on #{self.date_tabled.strftime( '%d-%m-%Y' )} has been "
    if self.is_correcting_answer
      tweet_text += "corrected by #{self.correcting_member.safe_twitter_reference}. "
    else
      tweet_text +=  "answered by #{self.answering_member.safe_twitter_reference}. "
    end
    tweet_text += "https://questions-statements.parliament.uk/written-questions/detail/#{self.date_tabled}/#{self.uin}"
  end
  
  def pertinent_date
    if is_correcting_answer
      pertinent_date = self.date_answer_corrected
    else
      pertinent_date = self.date_answered
    end
  end
  
  def title
    title = ''

    if self.is_correcting_answer
      title += "An earlier answer to a "
    else
      title +=  "A "
      end
    title += "question "
    title += "on #{self.heading} " if self.heading
    title += "tabled by #{self.asking_member.display_name} on #{self.date_tabled.strftime( '%d-%m-%Y' )} has been "
    if self.is_correcting_answer
      title += "corrected by #{self.correcting_member.display_name}."
    else
      title +=  "answered by #{self.answering_member.display_name}."
    end
    title
  end
end