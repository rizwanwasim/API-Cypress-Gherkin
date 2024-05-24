Feature: Delete User API

Scenario: Verify that a user can be deleted successfully
When I call "deleteUser" API
Then the status code of the response should be 204
