import { BrowserModule } from '@angular/platform-browser';
import { NgModule, LOCALE_ID } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { AnnouncementDetailComponent } from './announcement-detail/announcement-detail.component';
import { AnnouncementListComponent } from './announcement-list/announcement-list.component';
import { TopbarComponent } from './topbar/topbar.component';
import { SidebarComponent } from './sidebar/sidebar.component';
import { SearchbarComponent } from './searchbar/searchbar.component';
import { PopUpComponent } from './pop-up/pop-up.component';
import { ModalModule } from 'ngx-bootstrap/modal';
import { OwnerApartmentListComponent } from './owner-apartment-list/owner-apartment-list.component';
import { OwnerApartmentDetailComponent } from './owner-apartment-detail/owner-apartment-detail.component';

@NgModule({
  declarations: [
    AppComponent,
    AnnouncementDetailComponent,
    AnnouncementListComponent,
    TopbarComponent,
    SidebarComponent,
    SearchbarComponent,
    PopUpComponent,
    OwnerApartmentListComponent,
    OwnerApartmentDetailComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    ModalModule.forRoot()
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
