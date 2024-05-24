import { Then, When, Given } from "cypress-cucumber-preprocessor/steps";
import schemas from "../schemas";

beforeEach(() => {
  cy.fixture("endpoints").as("endpoints");
});

When(`I call {string} API`, function (endpointName) {
  let { endpoint, method, body } = this.endpoints[endpointName];
  cy.request({
    method,
    url: endpoint,
    body,
    failOnStatusCode: false,
  }).then((response) => {
    cy.wrap(response).as("response");
  });
});

Then("the status code of the response should be {int}", (statusCode) => {
  cy.get("@response").its("status").should("be.equal", statusCode);
});

Then("{string} in response should have {int} items", (jsonPath, length) => {
  cy.get("@response")
    .its("body." + jsonPath)
    .should("have.length", length);
});

Then("response should be returned after {int} seconds", (responseTime) => {
  cy.get("@response")
    .its("duration")
    .should("be.greaterThan", responseTime * 1000);
});

Then("the response schema should match {string} schema", (schemaName) => {
  const responseSchema = schemas[schemaName];
  cy.get("@response").then(function (response) {
    // Validate the response against the schema
    const parseResult = responseSchema.safeParse(response.body);

    // If validation fails, log the errors
    if (!parseResult.success) {
      console.log(
        "Response validation errors:",
        JSON.stringify(parseResult.error.errors)
      );
    }

    // Use expect to check if the response is valid
    expect(parseResult.success).to.be.true;
  });
});

Then("{string} in response should be equal to {string}", (jsonPath, value) => {
  cy.get("@response")
    .its("body." + jsonPath)
    .then((value) => value.toString())
    .should("be.equal", value);
});
