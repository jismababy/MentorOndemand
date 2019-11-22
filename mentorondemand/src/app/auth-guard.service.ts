import { Injectable } from '@angular/core';
import { CanActivate, Router, ActivatedRouteSnapshot } from '@angular/router';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuardService implements CanActivate{
  isLoggedIn = false;
  constructor(private route : Router, private _authService :AuthService){
  }

  canActivate(route: ActivatedRouteSnapshot): boolean{        
      this.isLoggedIn = this._authService.loggedIn;
      console.log("isLoggedIn: " + this.isLoggedIn);
      if(this.isLoggedIn){
          return true;
      }
      else{
          this.route.navigate(['/Login/']);
          return false;
      }        
  }
}

