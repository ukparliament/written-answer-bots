# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_defra => :environment do
  puts "tweeting new answers from DEFRA"
  tweet_set_up( 13 )
end