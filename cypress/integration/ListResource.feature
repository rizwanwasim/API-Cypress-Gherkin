Feature: List Resource API


Scenario: Verify that listing resources returns correct status code
When I call "listResource" API
Then the status code of the response should be 200

Scenario: Verify that listing resources returns response with correct schema
When I call "listResource" API
Then the response schema should match "listResourceSchema" schema

Scenario: Verify that listing resources returns 6 items per page by default
When I call "listResource" API
Then the response schema should match "listResourceSchema" schema
And "data" in response should have 6 items
And "per_page" in response should be equal to "6"

Scenario: Verify that listing resources with limit specified returns specified number of items per page
When I call "listResourceWithLimit" API
Then the response schema should match "listResourceSchema" schema
And "data" in response should have 3 items
And "per_page" in response should be equal to "3"

Scenario: Verify that listing resources returns page 1 by default
When I call "listResource" API
Then the response schema should match "listResourceSchema" schema
And "page" in response should be equal to "1"

Scenario: Verify that listing resources with page specified returns specified page
When I call "listResourceWithPage" API
Then the response schema should match "listResourceSchema" schema
And "page" in response should be equal to "2"

Scenario: Verify that listing resources with page and limit specified returns specified number of items on the specified page
When I call "listResourceWithPageAndLimit" API
Then the response schema should match "listResourceSchema" schema
And "per_page" in response should be equal to "3"
And "page" in response should be equal to "2"


Scenario: Verify response is returned after a delay if delay is specified
When I call "listResourceWithDelay" API
Then the status code of the response should be 200
And the response schema should match "listResourceSchema" schema
And response should be returned after 10 seconds
