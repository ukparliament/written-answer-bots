class Member < ApplicationRecord
  
  def twitter_reference
    twitter_reference = ''
    if self.handle
      twitter_reference = '@' + self.handle
    else
      twitter_reference = '#' + self.display_name.gsub( ' ', '' )
    end
    twitter_reference
  end
  
  def safe_twitter_reference
    self.display_name
  end
end
