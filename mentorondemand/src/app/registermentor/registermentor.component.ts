import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { IMentor } from 'src/app/IMentor.Module';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-registermentor',
  templateUrl: './registermentor.component.html',
  styleUrls: ['./registermentor.component.css']
})
export class RegistermentorComponent implements OnInit {

  constructor(private ItemService:UserService,private route:Router,private auth:AuthService) { }
userItem1:IMentor;
Item:IMentor;
flag:boolean=false;
  ngOnInit() {
    this.userItem1={
      
     
      mtUsername:'',
      mtPassword:'',
      mtFirstName:'',
      mtLastName:'',
      mtContactNumber:null,
      mtLinkedinUrl:'',
      mtRegDatetime:null,
      mtRegCode:null,
      mtYearsOfExperience:null,
      mtActive:null
    }
  
  }
  registerData1(Item:IMentor):void
  {
   
    Item.mtRegDatetime=new Date();
   this.ItemService.addMentor(Item).subscribe();
   this.flag=true;
   }
   logout()
   {
     this.auth.logOut();
     this.route.navigate(['/Home/']);
   }
}
