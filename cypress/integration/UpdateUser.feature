Feature: Update User API

Scenario: Verify that user data is updated successfully
When I call "updateUser" API
Then the response schema should match "updateUserSchema" schema
And "name" in response should be equal to "rizwan"
And "job" in response should be equal to "qa automation"
