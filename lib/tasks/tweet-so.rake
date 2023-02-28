# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_so => :environment do
  puts "tweeting new answers from SO"
  tweet_set_up( 2 )
end