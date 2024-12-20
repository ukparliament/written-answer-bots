# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_ag => :environment do
  puts "tweeting new answers from AG"
  tweet_set_up( 88 )
end