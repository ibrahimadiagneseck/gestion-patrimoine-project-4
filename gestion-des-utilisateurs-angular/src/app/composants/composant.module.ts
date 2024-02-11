import { NgModule } from '@angular/core';
import { LoaderComponent } from './loader/loader.component';
import { EnteteComponent } from './entete/entete.component';
import { MenuComponent } from './menu/menu.component';
import { PopupConfirmationSupprimerComponent } from './supprimer/popup-confirmation-supprimer/popup-confirmation-supprimer.component';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from '../app-routing.module';



@NgModule({
  declarations: [
    // composants
    LoaderComponent,
    EnteteComponent,
    MenuComponent,
    PopupConfirmationSupprimerComponent,


  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FormsModule,
    NgModule, // dropdown

    MatExpansionModule,
    MatSlideToggleModule,
    MatToolbarModule,
    MatButtonModule,
    MatIconModule,
    MatDividerModule,
    MatDialogModule,
    
    AppRoutingModule  
  ],
  exports: [
    // composants
    LoaderComponent,
    EnteteComponent,
    MenuComponent,
    PopupConfirmationSupprimerComponent,
  ]
})
export class ComposantModule { }
