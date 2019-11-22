export interface ILoginMentor
{
    mtId:number;
    mtUsername:string;
    mtPassword:string;
    mtFirstName:string;
    mtLastName:string;
    mtContactNumber:number;
    mtLinkedinUrl:string;
    mtRegDatetime?:Date;
    mtRegCode?:number;
    mtYearsOfExperience:number;
    mtActive?:boolean;

}