import { bcrypt } from "../../deps.ts";

import { UserLoginSchemaCreate } from "../../schema/user/userLoginsSchema.ts";
import { UserSchemaRegister, UserSchemaLogin } from '../../schema/user/usersSchema.ts';
import userService from "../user/userService.ts";
import userLoginService from "../user/userLoginService.ts";
import { LoginResponse, RegisterResponse } from "../../schema/auth/authSchema.ts";

const AuthentificationService = {
  async register(data: UserSchemaRegister): Promise<RegisterResponse> {
    try {
      const createUserResponse = await userService.register(data);

      if (createUserResponse.success) {
        return {
          success: true,
          message: "Enregistrement de l'utilisateur effectué avec succès",
          httpCode: 200,
        };
      } else {
        return {
          success: false,
          message: createUserResponse.message,
          httpCode: 400
        };
      }
    } catch (error) {
      throw new Error(`Erreur lors de l'enregistrement de l'utilisateur :  ${error.message}`);
    }
  },


  async login(userLogin: UserSchemaLogin): Promise<LoginResponse> {
    try {
      const resultExistUserEmail = await userService.findByEmail(userLogin.email);
      let passwordMatch = false;
      if (resultExistUserEmail.data !== null) {
        passwordMatch = await bcrypt.compare(userLogin.password, resultExistUserEmail.data.password);
      }

      if (!resultExistUserEmail.success || !passwordMatch) {
        return {
          success: false,
          message: "Erreur lors de la connexion : Informations de connexion invalides",
          httpCode: 400
        }
      }
        // Ajoute la connexion de l'utilisateur à notre table de suivi des connexions
      const userLoginCreate: UserLoginSchemaCreate = {
        userId: resultExistUserEmail.data.id
      }
      
      await userLoginService.create(userLoginCreate);

      return {
        success: true,
        message: "Connexion réussi",
        httpCode: 200,
      }
    } catch (error) {
      throw new Error(`Erreur lors de la connexion de l'utilisateur : ${error.message}`);
    }
  },
};

export default AuthentificationService;