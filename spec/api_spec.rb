require_relative './spec_helper'
require_relative '../lib/datafetcher'
require_relative '../lib/jsonparser'

describe '' do
	it 'queries reddit api and gets a string response' do
		url = 'https://api.reddit.com/r/dailyprogrammer/new'

		fetcher = DataFetcher.new
		$response = fetcher.fetch(url)
		expect($response).to be_an_instance_of(Array)
		
	end
	it 'can initialize a json parser' do
		$parser = JsonParser.new($response)
		expect($parser).to be_an_instance_of(JsonParser)	
	end
	it 'can get a list of posts as array' do
		expect($parser.getListOfNewItems()).to be_an_instance_of(Array)
	end
	it 'can get an individual post as json' do
		expect($parser.getPostByIndex(5)).to be_an_instance_of(Hash)	
	end
end
