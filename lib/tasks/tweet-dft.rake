# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_dft => :environment do
  puts "tweeting new answers from DFT"
  tweet_set_up( 27 )
end