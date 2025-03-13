# == Schema Information
#
# Table name: written_statements
#
#  id                 :integer          not null, primary key
#  house_name         :string(20)       not null
#  made_on            :date             not null
#  member_role        :string(255)      not null
#  posted_to_bluesky  :boolean          default(FALSE)
#  posted_to_mastodon :boolean          default(FALSE)
#  title              :string(255)      not null
#  uin                :string(20)       not null
#  answering_body_id  :integer          not null
#  member_id          :integer          not null
#
# Foreign Keys
#
#  fk_answering_body  (answering_body_id => answering_bodies.id)
#  fk_member          (member_id => members.id)
#
class WrittenStatement < ApplicationRecord
  
  belongs_to :member
  belongs_to :answering_body
  
  def mastodon_post_text
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
