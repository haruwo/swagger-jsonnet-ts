import * as types from './definitions/types'

/**
 * InternalServerError
 */
export interface InternalServerError {
    errors: {
        /**
          * Cause of error.
         */
        cause: string;
    }[];
}

/**
 * ValidationError
 */
export interface ValidationError {
    errors: {
        /**
         * Target field's json path.
         */
        target?: string;

        /**
         * Cause of error.
         */
        cause: string;
    }[];
}

/**
 * Account
 */
export interface Account {
    /**
     * Email
     */
    email: types.Email;

    /**
     * Nickname
     */
    nickname: types.Nickname;
}

export interface UpdateAccount extends Account {
    /**
     * Password as plain text
     */
    password?: types.Password;
}

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

