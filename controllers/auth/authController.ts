import { Context } from "../../deps.ts";

interface CustomContext extends Context {
    params: {
        [key: string]: string;
    };
}

const AuthController = {
    async register(ctx: Context) {
        
    },

    async login(ctx: Context) {

    },

    async logout(ctx: Context) {
       
    },

    async unsubscribe(ctx: CustomContext) {
    
    },
};

export default AuthController;
