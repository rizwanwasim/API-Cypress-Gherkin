Feature: Register User API

Scenario: Verify that user is registered successfully
When I call "register" API
Then the status code of the response should be 200
And the response schema should match "registrationSuccessSchema" schema


Scenario: Verify that user registration fails when password is missing
When I call "registerWithoutPassword" API
And the status code of the response should be 400
And the response schema should match "registrationFailedSchema" schema
