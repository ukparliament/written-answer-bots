# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_luhc => :environment do
  puts "tweeting new answers from LUHC"
  tweet_set_up( 211 )
end