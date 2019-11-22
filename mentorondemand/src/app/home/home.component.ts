import { Component, OnInit } from '@angular/core';
import { IMentorList } from './IMentorList.Module';
import { MentorService } from '../mentor.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor(private ItemMentor:MentorService) { }

  ngOnInit() {
   
  }

}
