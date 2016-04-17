require_relative './spec_helper'
require_relative '../lib/datafetcher'
require_relative '../lib/dpjsonparser'
require_relative '../lib/redditpost'

file_path = File.expand_path("../testdata", __FILE__) 
file = File.open(File.expand_path("./testdata", File.dirname(__FILE__)) ,"rb")
stub_response = file.read

describe 'datafetcher' do
	it 'queries reddit api and gets a string response' do
		url = 'https://api.reddit.com/r/dailyprogrammer/new'

		fetcher = DataFetcher.new
		$response = fetcher.fetch(url)
		expect($response).to be_an_instance_of(String)
		
	end
end
describe 'dpjsonparser' do
	it 'can initialize a json parser' do
		$parser = DPJsonParser.new(stub_response)
		expect($parser).to be_an_instance_of(DPJsonParser)	
	end
	it 'can get a list of posts as array' do
		expect($parser.getListOfPostHashes()).to be_an_instance_of(Array)
	end
	it 'can get an individual post as hash' do
		expect($parser.getPostAsHash(5)).to be_an_instance_of(Hash)	
	end
	it 'can list only the challenges' do
		p $parser.getPageOfChallenges().length
		expect($parser.getPageOfChallenges().all? {|post| post.title.include?("Challenge")})
	end
	it 'can create a redditpost object from a post' do
		individualPost = $parser.getPostAsRedditPost(5) 

		expect(individualPost.title).to eq("[2016-03-30] Challenge #260 [Intermediate] Diagonal collision")
		expect(individualPost.selftext.nil?).to eq(false)
		expect(individualPost.id.nil?).to eq(false)
	end
end

describe 'redditpost' do
	it 'can be initialized' do
		$post = RedditPost.new("sample title","sample selftext","sample id")

		expect($post).to be_an_instance_of(RedditPost)
	end
	it 'contains a title' do
		expect($post.title).to eq("sample title")
	end
	it 'contains selftext' do
		expect($post.selftext).to eq("sample selftext")
	end
	it 'contains sample id' do
		expect($post.id).to eq("sample id")
	end
end
