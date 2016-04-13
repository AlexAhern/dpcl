require_relative './spec_helper'
require_relative '../lib/datafetcher'

describe 'External request' do
	it 'queries reddit api' do
		url = 'https://api.reddit.com/r/dailyprogrammer/new'

		fetcher = DataFetcher.new
		response = fetcher.fetch(url)
		expect(response).to be_an_instance_of(String)
	end
end
