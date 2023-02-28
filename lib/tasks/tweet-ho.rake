# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_ho => :environment do
  puts "tweeting new answers from HO"
  tweet_set_up( 1 )
end