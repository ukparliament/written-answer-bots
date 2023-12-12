# We require the tweet code.
require 'post/mastodon/written-statements'

# We include tweet code from module.
include POST

task :post_mastodon_written_statements => :environment do
  puts "posting written statements to mastodon"
  post_mastodon
end