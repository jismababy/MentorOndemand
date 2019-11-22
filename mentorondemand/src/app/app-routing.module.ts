import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { RegistermentorComponent } from './registermentor/registermentor.component';
import { RegisteruserComponent } from './registeruser/registeruser.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { AdminComponent } from './admin/admin.component';
import { UserhomeComponent } from './userhome/userhome.component';
import { MentorhomeComponent } from './mentorhome/mentorhome.component';
import { AddmentorskillComponent } from './addmentorskill/addmentorskill.component';
import { AuthGuardService } from './auth-guard.service';

const routes: Routes = [
  {
    path:'Registermentor',
    component: RegistermentorComponent
  },
  {
    path:'Registeruser',
    component: RegisteruserComponent
  },
  {
    path:'Home',
    component: HomeComponent
  },
  {
    path:'Login',
    component: LoginComponent
  },
  {
    path:'Adminhome',
    component: AdminComponent,
 
  },
  {
    path:'Userhome',
    component:  UserhomeComponent,
    
  },
  {
    path:'Mentorhome',
    component:  MentorhomeComponent,
   
  },
  {
    path:'AddSkill',
    component:     AddmentorskillComponent 
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
