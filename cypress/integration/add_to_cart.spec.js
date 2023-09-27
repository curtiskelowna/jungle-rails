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

describe('Add to cart', () => {
  it('should add a product to the cart', () => {
    cy.visit('/products/1');
    cy.get(".product-detail button").click();
    cy.get(".nav-item").should("be.visible");
    cy.get(".nav-item").should("contain", "1");
  });
});