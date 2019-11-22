import { Component, OnInit } from '@angular/core';
import { MentorService } from '../mentor.service';
import { ITeckSkill } from '../admin/ITechSkill.Module';
import { Observable } from 'rxjs';
import { UserService } from '../user.service';
import { IMentorSkill } from '../IMentorSkill.Module';

@Component({
  selector: 'app-addmentorskill',
  templateUrl: './addmentorskill.component.html',
  styleUrls: ['./addmentorskill.component.css']
})
export class AddmentorskillComponent implements OnInit {

  constructor(private ItemMentor:MentorService,private ItemService:UserService) { }
  reqskill:ITeckSkill[];
  mentorSkill:IMentorSkill={};
  skillid:number;
  flag:boolean=false;
  ngOnInit() {
    
    this.reqskill=[{

    skId:null,
    skName:'',
    skToc:'',
    skDuration:null,
    skPrerequites:''

    }]

    this.ItemService.techReq().subscribe(result=>this.reqskill=result as ITeckSkill[]);
  }
  
  addMentorSkill(mentorSkill:IMentorSkill):void
  {
    
    this.mentorSkill.mid=this.ItemMentor.activementor;
    this.ItemMentor.addSkill(mentorSkill).subscribe(()=> { this.flag=true;});
  }

}
