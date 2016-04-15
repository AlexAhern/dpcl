require_relative '../../lib/datafetcher'
require_relative '../../lib/dpjsonparser'
require_relative '../../lib/redditpost'
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
	$newDailyProgrammer = DPJsonParser.new($fetchedFromDp)
	$listOfItems = $newDailyProgrammer.getListOfPostHashes()
end

Then(/^I get a list of (\d+) items$/) do |numberOfItems|
	raise "Expected #{numberOfItems} got #{$listOfItems.length}" unless $listOfItems.length.eql?(numberOfItems.to_i)
end

When(/^I choose a post by index$/) do
	@individualPost = $newDailyProgrammer.getPostAsRedditPost(Random.rand(25)) 
end

Then(/^it has a title, a selftext, and an id$/) do
	raise "Expected title, got no title" unless @individualPost.title.nil?() == falsei
	raise "Expected selftext, got no selftext" unless @individualPost.selftext.nil?() == false
	raise "Expected id, got no id" unless @individualPost.id.nil?() == false
end

