import * as pagination from "./internal/pagination";
import * as types from "./internal/types";

/**
 * Accounttypescript-json-schema
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

export interface Accounts extends pagination.Response<Account> {}

export interface CreateAccount extends Account {
    /**
     * Password as plain text
     */
    password: types.Password;
}

export interface UpdateAccount extends Account {
    /**
     * Password as plain text
     */
    password?: types.Password;
}
