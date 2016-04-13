require_relative './datafetcher'
require_relative './jsonparser'
require 'json'

fetcher = DataFetcher.new
json = fetcher.fetch("https://api.reddit.com/r/dailyprogrammer/new")
parser = JsonParser.new(json)


(0..24).each do |i|
	puts parser.getPostByIndex(i)["title"]
end

#title = title.slice!(24..-1).gsub(/\[|\]/," ").split(" ").map(&:capitalize).join('')
