import * as uuid from 'uuid'

describe("signup / signin", () => {
    before(function() {
        this.credential = {
            email: `${uuid.v4()}@fqdn`,
            password: uuid.v4()
        };
    });

    context("signup", () => {
        it("signup as new user", function() {
            const { email, password } = this.credential;
            const method = "post";
            const endpoint = "/auth/signup";
            const statusCode = 201;

            return cy
                .request(method, endpoint, {
                    email,
                    password,
                    nickname: "mekuru_chan"
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

                    Object.assign(this.credential, {
                        access_token: resp.body.access_token,
                        refresh_token: resp.body.refresh_token
                    });
                });
        });

        it("CALL GET /accounts/me with Bearer token", function() {
            const method = "get";
            const endpoint = "/accounts/me";
            const statusCode = 200;

            return cy
                .request({
                    method,
                    url: endpoint,
                    auth: { bearer: this.credential.access_token }
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
                });
        });

        it("CALL GET /accounts/me without Bearer token", () => {
            const method = "get";
            const endpoint = "/accounts/me";
            const statusCode = 401;

            cy.request({ method, url: endpoint, failOnStatusCode: false }).then(
                resp => {
                    expect(resp).to.have.property("status", statusCode);
                    cy.task("validateSwaggerSchema", {
                        endpoint,
                        method,
                        statusCode,
                        responseSchema: resp.body,
                        verbose: true
                    }).should("equal", null);
                }
            );
        });
    });

    describe("signin", () => {
        it("signin as exists user", function() {
            const { email, password } = this.credential;
            const method = "post";
            const endpoint = "/auth/signin";
            const statusCode = 201;

            return cy
                .request(method, endpoint, { email, password })
                .then(resp => {
                    expect(resp).to.have.property("status", statusCode);
                    cy.task("validateSwaggerSchema", {
                        endpoint,
                        method,
                        statusCode,
                        responseSchema: resp.body,
                        verbose: true
                    }).should("equal", null);

                    this.access_token = resp.body.access_token;
                    this.refresh_token = resp.body.refresh_token;
                });
        });

        it("CALL GET /accounts/me with Bearer token", function() {
            const method = "get";
            const endpoint = "/accounts/me";
            const statusCode = 200;

            return cy
                .request({
                    method,
                    url: endpoint,
                    auth: { bearer: this.credential.access_token }
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
                });
        });

        it("CALL GET /accounts/me without Bearer token", () => {
            const method = "get";
            const endpoint = "/accounts/me";
            const statusCode = 401;

            cy.request({ method, url: endpoint, failOnStatusCode: false }).then(
                resp => {
                    expect(resp).to.have.property("status", statusCode);
                    cy.task("validateSwaggerSchema", {
                        endpoint,
                        method,
                        statusCode,
                        responseSchema: resp.body,
                        verbose: true
                    }).should("equal", null);
                }
            );
        });
    });
});
