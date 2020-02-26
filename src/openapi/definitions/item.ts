import * as pagination from "./internal/pagination";
import * as types from "./internal/types";

export interface Item {
    /**
     * ID
     *
     * @example: "B00H6V3BWA"
     */
    id: string;

    /**
     * Name
     *
     * @example: "aRobot"
     */
    name: string;

    /**
     * Description
     *
     * @example: "人が搭乗可能なロボットです。"
     */
    description: string;

    /**
     * Thumbnail 画像の URL
     *
     * @example: "https://shop.reference.dmm.dev/v1/items/B00H6V3BWA/thumbnail?size=640"
     */
    thumbnailUrl: types.URL;
}

export interface Items extends pagination.Response<Item> {}

export interface CreateItem extends Omit<Item, "id"> {}

export interface UpdateItem extends Omit<Item, "id"> {}
