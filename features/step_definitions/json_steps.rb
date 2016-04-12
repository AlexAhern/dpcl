require_relative '../../lib/datafetcher'
require 'rspec'

When(/^I fetch a json file$/) do
fetcher = DataFetcher.new
@fetchedData = fetcher.fetch("http://alexahern.com/test.json")
end

Then(/^I get the expected file$/) do
test = '{"purpose":"test","author":"aahern"}'
raise "Expected #{test} got #{@fetchedData}" unless @fetchedData.eql?(test)
end
