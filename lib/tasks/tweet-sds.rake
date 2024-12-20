# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_sds => :environment do
  puts "tweeting new answers from SDS"
  tweet_set_up( 204 )
end