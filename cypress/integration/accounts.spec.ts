/// <reference path="../support/index.ts" />

describe("accounts", () => {
    // tslint:disable-next-line: no-function-expression
    before(function() {
        cy.credential().then(c => this.credential = c);
    });

    context("update profile", () => {
        it("CALL PUT /accounts/me", function() {
            const { email, access_token } = this.credential;
            const method = "put";
            const endpoint = "/accounts/me";
            const statusCode = 200;

            return cy
                .request({
                    method,
                    url: endpoint,
                    auth: { bearer: access_token },
                    body: { email, nickname: "mekuru_chan" },
                })
                .then(resp => {
                    expect(resp).to.have.property("status", statusCode);
                    cy.task("validateSwaggerSchema", {
                        endpoint,
                        method,
                        statusCode,
                        responseSchema: resp.body,
                        verbose: true
                    }).should("equal", null);

                    expect(resp.body).to.have.property("nickname", "mekuru_chan")
                });
        });

        it("CALL GET /accounts/me", function() {
            const { access_token } = this.credential;
            const method = "get";
            const endpoint = "/accounts/me";
            const statusCode = 200;

            return cy
                .request({
                    method,
                    url: endpoint,
                    auth: { bearer: access_token },
                })
                .then(resp => {
                    expect(resp).to.have.property("status", statusCode);
                    cy.task("validateSwaggerSchema", {
                        endpoint,
                        method,
                        statusCode,
                        responseSchema: resp.body,
                        verbose: true
                    }).should("equal", null);

                    expect(resp.body).to.have.property("nickname", "mekuru_chan")
                });
        });
    });
});
