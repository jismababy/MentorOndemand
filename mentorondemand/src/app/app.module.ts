import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RegistermentorComponent } from './registermentor/registermentor.component';
import { RegisteruserComponent } from './registeruser/registeruser.component';
import { FormsModule } from '@angular/forms';
import { HomeComponent } from './home/home.component';
import { HttpClient } from 'selenium-webdriver/http';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './login/login.component';
import { AdminComponent } from './admin/admin.component';
import { UserhomeComponent } from './userhome/userhome.component';
import { FilterPipe } from './userhome/FilterPipe';
import { MentorhomeComponent } from './mentorhome/mentorhome.component';
import { AddmentorskillComponent } from './addmentorskill/addmentorskill.component';

@NgModule({
  declarations: [
    AppComponent,
    RegistermentorComponent,
    RegisteruserComponent,
    HomeComponent,
    LoginComponent,
    AdminComponent,
    UserhomeComponent,
    FilterPipe,
    MentorhomeComponent,
    AddmentorskillComponent

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
