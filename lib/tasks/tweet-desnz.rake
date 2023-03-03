# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_desnz => :environment do
  puts "tweeting new answers from DESNZ"
  tweet_set_up( 215 )
end