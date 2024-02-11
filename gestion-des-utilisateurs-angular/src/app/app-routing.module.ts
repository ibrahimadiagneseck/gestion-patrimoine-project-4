import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { AuthActivateRouteGuard } from './routeguards/auth.routeguard';
import { AccueilComponent } from './components/accueil/accueil.component';

const routes: Routes = [
  { path: '', redirectTo: '/connexion', pathMatch: 'full'},
  { path: 'connexion', component: LoginComponent},
  { path: 'accueil', component: AccueilComponent, canActivate: [AuthActivateRouteGuard]},
  { path: 'deconnexion', component: LogoutComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
