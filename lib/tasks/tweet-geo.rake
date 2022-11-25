# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_geo => :environment do
  puts "tweeting new answers from GEO"
  tweet_set_up( 31 )
end