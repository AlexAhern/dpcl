require 'json'

class JsonParser
	def initialize(json)
		@firstPage = JSON.parse(json)
	end
	def getListOfNewItems()
		@newItems =  @firstPage["data"]["children"]
	end

	def getPostByIndex(index)
		@individualPost = @firstPage["data"]["children"][index]["data"]
	end

end
