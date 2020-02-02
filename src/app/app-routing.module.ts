import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AnnouncementDetailComponent } from './announcement-detail/announcement-detail.component';
import { AnnouncementListComponent } from './announcement-list/announcement-list.component';
import { OwnerApartmentListComponent } from './owner-apartment-list/owner-apartment-list.component';
import { ApartmentDetailComponent } from './apartment-detail/apartment-detail.component';


const routes: Routes = [{
  path: '',
  children: [
    { path: '', redirectTo: 'list', pathMatch: 'full' },
    { path: 'list', component: AnnouncementListComponent },
    { path: 'detail/:id', component: AnnouncementDetailComponent},
    { path: 'apartmentList', component: OwnerApartmentListComponent },
    { path: 'apartmentDetail/:id', component: ApartmentDetailComponent },
  ]
}];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
