# We require the tweet code.
require 'post/bluesky/written_statements'

# We include tweet code from module.
include Post::Bluesky::WrittenStatements

task :post_bluesky_written_statements => :environment do
  puts "posting written statements to bluesky"
  post_bluesky
end