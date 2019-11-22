export interface ILoginUser
{ 
    usId:number;
    usUsername:string;
    usPassword:string;
    usFirstName:string;
    usLastName:string;
    usContactNumber:number;
    usRegDatetime:Date;
    usRegcode?:number;
    usForceResetPassword?:boolean;
    usActive?:boolean;


}