import * as types from "./internal/types";
import * as pagination from "./internal/pagination";

export interface Cart {
    /**
     * ID
     *
     * @example: "xxxxxxxxxxx"
     */
    id: string;
}

export interface UpdateCart {
    // TOBE
}

export interface CartItem {
    /**
     * Item ID
     * 
     * @example: "B00H6V3BWA"
     */
    itemID: string;

    /**
     * 購入数
     *
     * @minimum 1
     * @example 1
     */
    count: types.Integer;
}

export interface CreateCartItem {
    /**
     * Item ID
     * 
     * @example: "B00H6V3BWA"
     */
    itemID: string;

    /**
     * 購入数
     *
     * @minimum 1
     * @example 1
     */
    count: types.Integer;
}

export interface UpdateCartItem {
    /**
     * 購入数
     *
     * @minimum 1
     * @example 1
     */
    count: types.Integer;
}

export interface CartItems extends pagination.Response<CartItem> {}