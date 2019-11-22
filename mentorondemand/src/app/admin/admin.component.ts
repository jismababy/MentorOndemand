import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { ITeckSkill } from './ITechSkill.Module';
import { Observable } from 'rxjs';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-admin',
  templateUrl: './admin.component.html',
  styleUrls: ['./admin.component.css']
})
export class AdminComponent implements OnInit {

  constructor(private ItemService:UserService,private route : Router,private auth:AuthService) { }
reqtech:Observable<ITeckSkill[]>;
  ngOnInit() {
    this.reqtech=this.ItemService.techReq();
   
  }
  logout()
  {
    this.auth.logOut();
    this.route.navigate(['/Home/']);
  }
}
