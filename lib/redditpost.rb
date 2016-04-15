class RedditPost
attr_reader :title, :selftext, :id
def initialize(title, selftext, id)
	@title = title
	@selftext = selftext
	@id = id
end

end
