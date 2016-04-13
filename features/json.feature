Feature: fetch data

Scenario: Can fetch a json file
When I fetch a json file
Then I get the expected file

Scenario: Can parse front page json
When I fetch the new from daily programmer subreddit
Then I get a list of 25 items

Scenario: Can get an individual item from the list
When I choose a post by index 
Then it has a title
