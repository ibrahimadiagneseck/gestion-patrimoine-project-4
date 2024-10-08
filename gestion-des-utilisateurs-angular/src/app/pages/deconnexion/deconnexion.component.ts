import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { User } from 'src/app/model/user.model';

@Component({
  selector: 'app-deconnexion',
  templateUrl: './deconnexion.component.html',
  styleUrls: ['./deconnexion.component.css']
})
export class DeconnexionComponent implements OnInit {
  
  user = new User();
  constructor(private router : Router) { 

  }

  ngOnInit(): void {
    window.sessionStorage.setItem("userdetails","");
    window.sessionStorage.setItem("XSRF-TOKEN","");
    this.router.navigate(['/connexion']);
  }


}
