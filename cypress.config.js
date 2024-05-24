const { defineConfig } = require("cypress");
const cucumber = require("cypress-cucumber-preprocessor").default;

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
      on("file:preprocessor", cucumber());
    },
    env: {
      allureReuseAfterSpec: true,
    },
    specPattern: "cypress/integration/*.feature",
    baseUrl: "https://reqres.in/api",
    chromeWebSecurity: false,
  },
});
