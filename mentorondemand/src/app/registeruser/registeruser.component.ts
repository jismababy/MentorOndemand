import { Component, OnInit } from '@angular/core';
import { IUser } from './IUser.Module';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-registeruser',
  templateUrl: './registeruser.component.html',
  styleUrls: ['./registeruser.component.css']
})
export class RegisteruserComponent implements OnInit {

  constructor(private ItemService:UserService,private route:Router,private auth:AuthService) { }
flag:boolean=false;
userItem:IUser;
  ngOnInit() {
    this.userItem={
      
    
    usUsername:'',
    usPassword:'',
    usFirstName:'',
    usLastName:'',
    usContactNumber:null,
    usRegDatetime:null,
    usRegcode:null,
    usForceResetPassword:null,
    usActive:null
    }
  }
  registerData(userItem:IUser):void
  {
    
  
     this.ItemService.addUser(this.userItem).subscribe();
  this.flag=true;
   
   }
   logout()
   {
     this.auth.logOut();
     this.route.navigate(['/Home/']);
   }
 

}
