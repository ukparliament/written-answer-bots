# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_dit => :environment do
  puts "tweeting new answers from DIT"
  tweet_set_up( 202 )
end