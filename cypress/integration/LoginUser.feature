Feature: Login User API

Scenario: Verify that a user can be logged in successfully
When I call "login" API
Then the status code of the response should be 200
And the response schema should match "loginSuccessSchema" schema

Scenario: Verify that login fails when password is missing
When I call "loginWithNoPassword" API
Then the status code of the response should be 400
And the response schema should match "loginFailedSchema" schema

Scenario: Verify that login fails when e-mail address is invalid
When I call "loginWithInvalidEmail" API
Then the status code of the response should be 400
And the response schema should match "loginFailedSchema" schema


