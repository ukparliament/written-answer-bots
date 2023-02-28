# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_co => :environment do
  puts "tweeting new answers from CO"
  tweet_set_up( 53 )
end