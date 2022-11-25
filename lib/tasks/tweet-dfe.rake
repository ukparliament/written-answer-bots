# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_dfe => :environment do
  puts "tweeting new answers from DFE"
  tweet_set_up( 60 )
end