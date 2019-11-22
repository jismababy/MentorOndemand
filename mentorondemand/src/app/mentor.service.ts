import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ITeckSkill } from './admin/ITechSkill.Module';
import { IMentorList } from './home/IMentorList.Module';
import { IView } from './mentorhome/IView.Module';
import { IMentorSkill } from './IMentorSkill.Module';

@Injectable({
  providedIn: 'root'
})
export class MentorService {
activeuser:number;
activementor:number;
mentorname:string="";
  constructor(private http: HttpClient) { }
  
  mentorList():Observable<IMentorList[]>
{
  return this.http.get<IMentorList[]>('http://localhost:10392/api/UserFunc');
}
nomiMentor(item:IMentorList):Observable<{}>
{
  return this.http.post<IMentorList>('http://localhost:10392/api/Nomination'+'/'+this.activeuser,item)
}
viewNominate():Observable<{}>
{
  return this.http.get<IView>('http://localhost:10392/api/Nomination'+'/'+this.activementor)
}
addSkill(item:IMentorSkill):Observable<{}>
{
 
  return this.http.post<IMentorSkill>('http://localhost:10392/api/UserFunc',item,{
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })});
}
}
