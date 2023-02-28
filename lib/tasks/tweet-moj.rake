# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_moj => :environment do
  puts "tweeting new answers from MOJ"
  tweet_set_up( 54 )
end