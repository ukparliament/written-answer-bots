# We require the tweet code.
require 'tweet/tweet'

# We include tweet code from module.
include TWEET

task :tweet_sds => :environment do
  puts "tweeting new answers from SDS"
  tweet_set_up( 204 )
end