# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_ho => :environment do
  puts "tweeting new answers from HO"
  tweet_set_up( 1 )
end