require_relative '../../lib/datafetcher'
require_relative '../../lib/jsonparser'
require 'rspec'

When(/^I fetch a json file$/) do
	fetcher = DataFetcher.new
	@fetchedData = fetcher.fetch("http://alexahern.com/test.json")
end

Then(/^I get the expected file$/) do
	test = '{"purpose":"test","author":"aahern"}'
	raise "Expected #{test} got #{@fetchedData}" unless @fetchedData.eql?(test)
end

When(/^I fetch the new from daily programmer subreddit$/) do
	$fetchedFromDp = DataFetcher.new.fetch("https://api.reddit.com/r/dailyprogrammer/new")
	$newDailyProgrammer = JsonParser.new($fetchedFromDp)
	$listOfItems = $newDailyProgrammer.getListOfNewItems()
end

Then(/^I get a list of (\d+) items$/) do |numberOfItems|
	raise "Expected #{numberOfItems} got #{$listOfItems.length}" unless $listOfItems.length.eql?(numberOfItems.to_i)
end

When(/^I choose a post by index$/) do
	@individualPost = $newDailyProgrammer.getPostByIndex(Random.rand(25)) 
end

Then(/^it has a title$/) do
	@individualPost.key?("title")
end

