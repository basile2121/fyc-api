import { Context } from "../../deps.ts";

interface CustomContext extends Context {
    params: {
        [key: string]: string;
    };
}

const TransactionController = {
    async getTransactionByUserId(ctx: CustomContext) {
        
    },

    async buySharePrice(ctx: Context) {
    
    },

    async sellSharePrice(ctx: CustomContext) {

    }
};


export default TransactionController;

