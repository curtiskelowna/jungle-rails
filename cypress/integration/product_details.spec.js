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

describe('Product details navigation', () => {
  it('should navigate to a product details page on product click', () => {
    cy.visit('/');
    cy.get(".products article").first().click();
    cy.url().should('include', '/products/');
    cy.get(".product-detail").should("be.visible");
  });
});