import { Context } from "../../deps.ts";

interface CustomContext extends Context {
    params: {
        [key: string]: string;
    };
}

const WalletSharePriceController = {
    async findWalletSharePriceByUserId(ctx: CustomContext) {
        
    },

    async findUserSharePrice(ctx: CustomContext) {
        
    },
};

export default WalletSharePriceController;
