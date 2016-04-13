require_relative './datafetcher'

fetcher = DataFetcher.new
puts fetcher.fetch("https://api.reddit.com/r/dailyprogrammer/new")
