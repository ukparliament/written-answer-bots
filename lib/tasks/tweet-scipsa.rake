# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_scipsa => :environment do
  puts "tweeting new answers from SCIPSA"
  tweet_set_up( 90 )
end