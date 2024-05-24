Feature: List User API


Scenario: Verify that listing users returns correct status code
When I call "listUser" API
Then the status code of the response should be 200

Scenario: Verify that listing users returns response with correct schema
When I call "listUser" API
Then the response schema should match "listUserSchema" schema

Scenario: Verify that listing users returns 6 items per page by default
When I call "listUser" API
Then the response schema should match "listUserSchema" schema
And "data" in response should have 6 items
And "per_page" in response should be equal to "6"

Scenario: Verify that listing users with limit specified returns specified number of items per page
When I call "listUserWithLimit" API
Then the response schema should match "listUserSchema" schema
And "data" in response should have 2 items
And "per_page" in response should be equal to "2"

Scenario: Verify that listing users returns page 1 by default
When I call "listUser" API
Then the response schema should match "listUserSchema" schema
And "page" in response should be equal to "1"

Scenario: Verify that listing users with page specified returns specified page
When I call "listUserWithPage" API
Then the response schema should match "listUserSchema" schema
And "page" in response should be equal to "3"

Scenario: Verify that listing users with page and limit specified returns specified number of items on the specified page
When I call "listUserWithPageAndLimit" API
Then the response schema should match "listUserSchema" schema
And "per_page" in response should be equal to "2"
And "page" in response should be equal to "3"

Scenario: Verify that response is returned after a delay if delay is specified
When I call "listUserWithDelay" API
Then the status code of the response should be 200
And the response schema should match "listUserSchema" schema
And response should be returned after 7 seconds
