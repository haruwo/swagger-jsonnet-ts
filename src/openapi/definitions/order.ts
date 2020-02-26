import * as pagination from "./internal/pagination";
import * as types from "./internal/types";

export interface Order {
    /**
     * ID
     *
     * @example: "B00H6V3BWA"
     */
    id: string;

    /**
     * Status
     */
    status: OrderStatus;

    /**
     * Items
     */
    items: OrderItem[];
}

type OrderStatus = "Accounting" | "Purchased" | "Canceling" | "Canceled";

export interface OrderItem {
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

export type CreateOrder = 
{
    /**
     * Items
     */
    items: OrderItem[];
} | {
    /**
     * Cart ID
     * 
     * @example: "xxxxxxxxxxx"
     */
    cartID: string;
}

export interface Orders extends pagination.Response<Order> {}
