# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_dwp => :environment do
  puts "tweeting new answers from DWP"
  tweet_set_up( 29 )
end