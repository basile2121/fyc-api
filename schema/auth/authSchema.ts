import { ValidationError } from "../../deps.ts"

export interface RegisterResponse {
    success: boolean,
    message: string,
    httpCode: number,
    errors?: ValidationError[]
}

export interface LoginResponse {
    success: boolean,
    message: string,
    httpCode: number,
}