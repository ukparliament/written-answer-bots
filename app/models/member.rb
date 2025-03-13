# == Schema Information
#
# Table name: members
#
#  id           :integer          not null, primary key
#  display_name :string(255)      not null
#  handle       :string(255)
#  mnis_id      :integer          not null
#
class Member < ApplicationRecord
  
  def twitter_reference
    twitter_reference = ''
    # If the Member has a Twitter handle ...
    if self.handle
      
      # ... set the Twitter reference to @ mention that handle.
      twitter_reference = '@' + self.handle
      
    # Otherwise, if the Member does not have a Twitter handle ...
    else
      
      # ... set the Twitter reference to their display name.
      twitter_reference = self.display_name
    end
    twitter_reference
  end
end
