Feature: Get User API


Scenario: Verify that a user can be retrieved
When I call "getUser" API
Then the status code of the response should be 200

Scenario: Verify that the retrieved user has correct schema
When I call "getUser" API
Then the response schema should match "getUserSchema" schema

Scenario: Verify the response returns a user object for an existing ID
When I call "getUser" API
Then the response schema should match "getUserSchema" schema
And "data.id" in response should be equal to "1"

Scenario: Verify the response returns not found for a non-existing ID
When I call "getUserNonExisting" API
Then the status code of the response should be 404
