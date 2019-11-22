import { Component, OnInit } from '@angular/core';
import { MentorService } from '../mentor.service';
import { Observable } from 'rxjs';
import { IMentorList } from '../home/IMentorList.Module';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-userhome',
  templateUrl: './userhome.component.html',
  styleUrls: ['./userhome.component.css']
})
export class UserhomeComponent implements OnInit {

 searchKey:string;
flag:boolean=false;
  constructor(private ItemMentor:MentorService,private route:Router,private auth:AuthService) { }

  reqlist:IMentorList[];
  ngOnInit() {
    this.ItemMentor.mentorList().subscribe(x=>{this.reqlist=x as IMentorList[]});
    console.log(this.reqlist);
  }
  nominate(item:IMentorList):void
  {
    this.ItemMentor.nomiMentor(item).subscribe(()=> { this.flag=true;});
  
  }
  logout()
{
  this.auth.logOut();
  this.route.navigate(['/Home/']);
}


}
