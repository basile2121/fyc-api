export interface UserSchema {
  id: number;
  firstName: string;
  lastName: string;
  email: string;
  password: string;
  wallet: number;
  isCdu: boolean;
  cduAcceptedAt: Date;
  registerAt: Date;
  updatedAt: Date;
  unsubscribeAt: Date;
  isActive: boolean;
  roleId: number;
}

export interface UserSchemaFindAllFilters {
  isActive?: boolean;
  roleId?: number;
}

export interface UserSchemaLogin {
  email: string;
  password: string;
}

export interface UserSchemaCreate {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
  wallet: number;
  isCdu: boolean;
  cduAcceptedAt?: Date;
  roleId: number;
}

export interface UserSchemaRegister {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
  wallet: number;
  isCdu: boolean;
  cduAcceptedAt?: Date;
}

export interface UserSchemaRoleUpdate {
  id: number;
  roleId: number;
}

export interface UserSchemaInfoUpdate {
  id: number;
  firstName?: string;
  lastName?: string;
  email?: string;
}

export interface UserSchemaWalletUpdate {
  id: number;
  value: number;
}

export interface UserSchemaActiveUpdate {
  id: number;
  isActive: boolean;
}
