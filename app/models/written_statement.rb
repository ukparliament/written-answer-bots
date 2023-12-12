class WrittenStatement < ApplicationRecord
  
  belongs_to :member
  belongs_to :answering_body
  
  def mastondon_post_text
    post_text = ''
    post_text += self.title + '. ' if self.title
    post_text += 'Statement made by ' + self.member_name + ' ' if self.member_name
    post_text += '(' + self.member_role + ') ' if self.member_role
    post_text += 'on behalf of the ' + self.answering_body_name + ' ' if self.answering_body_name
    post_text += self.url
    post_text
  end
  
  def bluesky_post_text
    post_text = ''
    if self.title
      if self.title.length > 100
        post_text += self.title.truncate( 100 ) + ' '
      else
        post_text += self.title + '. '
      end
    end
    post_text += 'Statement made by ' + self.member_name + ' ' if self.member_name
    post_text += 'on behalf of the ' + self.answering_body_name + ' ' if self.answering_body_name
    post_text += self.url
    post_text
  end
  
  def url
    "https://questions-statements.parliament.uk/written-statements/detail/#{self.made_on}/#{self.uin}"
  end
end
