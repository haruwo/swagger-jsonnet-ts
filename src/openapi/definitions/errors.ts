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

