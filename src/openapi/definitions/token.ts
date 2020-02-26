import * as types from "./internal/types";
import { Account } from "./account";

export interface Token {
    /**
     * Access token (JWT)
     */
    access_token: types.AccessToken;

    /**
     * Refresh token (JWT)
     */
    refresh_token: types.RefreshToken;

    /**
     * Always 'Bearer'
     *
     * @example "Bearer"
     */
    type: string;
}

export interface RefreshTokenRequest {
    /**
     * Refresh token (JWT)
     */
    refresh_token: types.RefreshToken;
}

export interface SignupRequest extends Account {
    /**
     * Password as plain text
     */
    password: types.Password;
}

export interface SigninRequest {
    /**
     * Email
     */
    email: types.Email;

    /**
     * Password as plain text
     */
    password: types.Password;
}
