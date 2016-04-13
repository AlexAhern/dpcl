require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost:true)

file = File.open("./testdata", "rb")
contents = file.read
RSpec.configure do |config|
	config.before(:each) do
		stub_request(:get, "https://api.reddit.com/r/dailyprogrammer/new").
			with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
			to_return(status: 200, body: contents ,headers: {})
	end
end

