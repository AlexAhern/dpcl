require 'json'
require 'net/http'

class DataFetcher
	def fetch(data)
	test = Net::HTTP.get(URI(data)) #=> String
	test.strip
	end
end
