import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { ILoginUser } from '../registeruser/ILoginUser.Module';
import { ILoginMentor } from '../registeruser/ILoginMentor.Module';
import { IAdmin } from '../IAdmin.Module';
import { MentorService } from '../mentor.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor(private ItemService:UserService,private route : Router,private ItemMentor:MentorService) { }
  user:ILoginUser;
  mentor:ILoginMentor;
  admin:IAdmin;
  flag:boolean=false;
  msg:string;
 
  ngOnInit() {
  }
  onSubmit(userId:string,pass:string,role:string){

if(role=="User")
{

    this.ItemService.getUser(userId,pass).subscribe((result:ILoginUser) =>{
      this.user=result;
      if(this.user==null)
      {        
        this.flag=true;
        this.msg="Invalid Credentials";
      }
     else if(role=="User")
      {           

       this.ItemMentor.activeuser=this.user.usId;
       this.ItemService.username=this.user.usFirstName;
       this.ItemService.getTokenUser(this.user.usUsername);
      }
    } ); 
   
 
  }
 else if(role=="Mentor")
{


    this.ItemService.getMentor(userId,pass).subscribe((result:ILoginMentor) =>{
      this.mentor=result;
      if(this.mentor==null)
      {        
        this.flag=true;
        this.msg="Invalid Credentials";
      }
     else if(role=="Mentor")
      {  
        console.log("hi");       
        this.ItemMentor.activementor=this.mentor.mtId;
        this.ItemMentor.mentorname=this.mentor.mtFirstName;
        this.ItemService.getTokenMentor(this.mentor.mtUsername);    
      }
    } ); 
  }
  else if(role=="Admin")
  {
  
      this.ItemService.getAdmin(userId,pass).subscribe((result:IAdmin) =>{
        this.admin=result;
        if(this.admin==null)
        {        
          this.flag=true;
          this.msg="Invalid Credentials";
        }
       else if(role=="Admin")
        {       
       
    // this.ItemService.activeuserid=this.user.userId;
    this.ItemService.getTokenAdmin(this.admin.username);   
        }
      } ); 
    }



  }
}
