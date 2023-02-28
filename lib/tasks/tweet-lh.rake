# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_lh => :environment do
  puts "tweeting new answers from LH"
  tweet_set_up( 34 )
end