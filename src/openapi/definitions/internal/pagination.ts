import * as types from './types'

/**
 * PageInfo
 */
export interface PageInfo {
    /**
     * 次ページ取得時に使う値
     * 
     * @example null
     */
    nextCursor?: string

    /**
     * 次ページが存在するか
     * 
     * @example false
     */
    hasNextPage: boolean
}

/**
 * Response
 */
export interface Response<T> {
    /**
     * 総件数
     * 
     * @example 1
     */
    totalCount: types.Integer

    /**
     * ページング情報
     */
    pageInfo: PageInfo

    /**
     * Chunk
     */
    items: T[]
}
