Feature: Create User API

Scenario: Verify that a user can be created successfully
When I call "createUser" API
Then the status code of the response should be 201
And the response schema should match "createUserSchema" schema
And "name" in response should be equal to "rizwan"
And "job" in response should be equal to "qa"
