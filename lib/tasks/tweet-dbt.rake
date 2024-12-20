# We require the tweet code.
require 'tweet'

# We include tweet code from module.
include Tweet

task :tweet_dbt => :environment do
  puts "tweeting new answers from DBT"
  tweet_set_up( 214 )
end