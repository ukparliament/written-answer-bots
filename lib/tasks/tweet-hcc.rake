# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_hcc => :environment do
  puts "tweeting new answers from HCC"
  tweet_set_up( 18 )
end