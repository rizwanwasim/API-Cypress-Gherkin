Feature: Get Resource API


Scenario: Verify that a resource can be retrieved
When I call "getResource" API
Then the status code of the response should be 200

Scenario: Verify that the retrieved resource has correct schema
When I call "getResource" API
Then the response schema should match "getResourceSchema" schema

Scenario: Verify that the retrieved resource has correct ID
When I call "getResource" API
Then the response schema should match "getResourceSchema" schema
Then "data.id" in response should be equal to "1"

Scenario: Verify the response returns not found for a non-existing ID
When I call "getResourceNonExisting" API
Then the status code of the response should be 404
