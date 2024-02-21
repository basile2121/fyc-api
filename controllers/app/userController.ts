import { Context } from "../../deps.ts";

interface CustomContext extends Context {
    params: {
        [key: string]: string;
    };
}

const UserController = {
    async getUserById(ctx: CustomContext) {
        
    },

    async updateUserInfo(ctx: CustomContext) {
        
    },

    async updateUserWallet(ctx: CustomContext) {
       
    },
};

export default UserController;
