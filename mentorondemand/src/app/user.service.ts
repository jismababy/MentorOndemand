import { Injectable } from '@angular/core';
import { IUser } from './registeruser/IUser.Module';
import { HttpHeaders, HttpClient} from '@angular/common/http';
import { IMentor } from './IMentor.Module';
import { Observable } from 'rxjs';
import { ILoginUser } from './registeruser/ILoginUser.Module';
import { ILoginMentor } from './registeruser/ILoginMentor.Module';
import { IAdmin } from './IAdmin.Module';
import { ITeckSkill } from './admin/ITechSkill.Module';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class UserService {
username:string="";
  constructor(private http: HttpClient, private route:Router) { }
  addUser(item:IUser)
  {
  
    return this.http.post<IUser>('http://localhost:7625/api/user',item,
    {headers:new HttpHeaders({ 'Content-Type': 'application/json' })
    });
  }
addMentor(item:IMentor)
  {
 
    return this.http.post<IMentor>('http://localhost:7625/api/mentor',item,
    {headers:new HttpHeaders({ 'Content-Type': 'application/json' })
  });
}
getUser(userid:string,pass:string):Observable<ILoginUser>
{
  return this.http.get<ILoginUser>('http://localhost:7625/api/user'+'/'+userid+'/'+pass);
}

getTokenUser(username:string)
{
    this.http.get('http://localhost:42722/api/'+'JwtToken/GetUserToken/'+username).
    subscribe((res:any)=>{
      localStorage.setItem('token2',res.token);
      console.log(res.token);
      this.route.navigate(['/Userhome/']);
    })
  }


  getTokenAdmin(username:string)
  {
      this.http.get('http://localhost:42722/api/'+'JwtToken/GetUserToken/'+username).
      subscribe((res:any)=>{
        localStorage.setItem('token2',res.token);
        console.log(res.token);
        this.route.navigate(['/Adminhome/']);
      })
    }


getMentor(userid:string,pass:string):Observable<ILoginMentor>
{

  return this.http.get<ILoginMentor>('http://localhost:7625/api/mentor'+'/'+userid+'/'+pass);
}
getTokenMentor(username:string)
{
    this.http.get('http://localhost:42722/api/'+'JwtToken/GetUserToken/'+username).
    subscribe((res:any)=>{
      localStorage.setItem('token2',res.token);
      console.log(res.token);
      this.route.navigate(['/Mentorhome/']);
    })
  }
getAdmin(userid:string,pass:string):Observable<IAdmin>
{
 
  return this.http.get<IAdmin>('http://localhost:7625/api/admin'+'/'+userid+'/'+pass);
}
techReq():Observable<ITeckSkill[]>
{
  
  return this.http.get<ITeckSkill[]>('http://localhost:7625/api/admin');
}
}
