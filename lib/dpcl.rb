require_relative './datafetcher'
require_relative './dpjsonparser'
require_relative './redditpost'
require 'json'

fetcher = DataFetcher.new
json = fetcher.fetch("https://api.reddit.com/r/dailyprogrammer/new")
parser = DPJsonParser.new(json)


(0..24).each do |i|
	puts parser.getPostAsRedditPost(i).title
end

#title = title.slice!(24..-1).gsub(/\[|\]/," ").split(" ").map(&:capitalize).join('')
