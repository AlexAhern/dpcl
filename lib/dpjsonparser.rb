require 'json'

class DPJsonParser
	def initialize(json)
		@firstPage = JSON.parse(json)
	end
	def getListOfPostHashes()
		newItems =  @firstPage["data"]["children"]
	end

	def getPostAsHash(index)
		individualPostAsHash = @firstPage["data"]["children"][index]["data"]
	end

	def getPostAsRedditPost(index)
		hash = getPostAsHash(index)
		post = RedditPost.new(hash["title"], hash["selftext"], hash["id"])
	end
end

