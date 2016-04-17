require 'json'
require_relative './redditpost'

class DPJsonParser
	def initialize(json)
		@parsedJson = JSON.parse(json)
	end

	def getListOfPostHashes()
		postHashes =  @parsedJson["data"]["children"]
	end

	def getPostAsHash(index)
		individualPostAsHash = getListOfPostHashes()[index]["data"]
	end

	def getPostAsRedditPost(index)
		hash = getPostAsHash(index)
		post = RedditPost.new(hash["title"], hash["selftext"], hash["id"])
	end

	def getPageOfChallenges()
		pageOfChallenges = []
		getListOfPostHashes().each_index do |index|
			post = getPostAsRedditPost(index)
			if post.title.include?("Challenge")
				pageOfChallenges.push(post)
			end
		end	
		pageOfChallenges
	end
end

