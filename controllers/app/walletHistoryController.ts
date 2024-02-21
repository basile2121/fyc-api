import { Context } from "../../deps.ts";

interface CustomContext extends Context {
  params: {
    [key: string]: string;
  };
}

const WalletHistoryController = {
  async findWalletHistoryByUserId(ctx: CustomContext) {
    
  },
};

export default WalletHistoryController;
