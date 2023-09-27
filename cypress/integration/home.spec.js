// Write a basic test to visit the home page of our Jungle App.

describe('Home Page', () => {
  it('successfully loads', () => {
    cy.visit('/')
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
});