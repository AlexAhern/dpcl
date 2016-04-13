require 'json'
require 'net/http'

class DataFetcher
	def fetch(url)
		response = Net::HTTP.get(URI(url)) #=> String
		response.strip
	end
end

