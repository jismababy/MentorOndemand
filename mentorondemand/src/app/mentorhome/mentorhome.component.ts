import { Component, OnInit } from '@angular/core';
import { MentorService } from '../mentor.service';
import { IMentorList } from '../home/IMentorList.Module';
import { IView } from './IView.Module';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-mentorhome',
  templateUrl: './mentorhome.component.html',
  styleUrls: ['./mentorhome.component.css']
})
export class MentorhomeComponent implements OnInit {

  constructor(private ItemMentor:MentorService,private route:Router,private auth:AuthService) { }
  viewlist:IView[];
  ngOnInit() {
    this.ItemMentor.viewNominate().subscribe(x=>{this.viewlist=x as IView[]});
   

  }
  logout()
  {
    this.auth.logOut();
    this.route.navigate(['/Home/']);
  }

}
