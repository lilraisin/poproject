import { Component, OnInit } from '@angular/core';
import { ApartmentService } from '../apartment.service';

@Component({
  selector: 'po-owner-apartment-list',
  templateUrl: './owner-apartment-list.component.html',
  styleUrls: ['./owner-apartment-list.component.scss']
})
export class OwnerApartmentListComponent implements OnInit {

  private login: string = undefined;
  public apartments: Array<any> = undefined;
  
  constructor(private service: ApartmentService) {}
  ngOnInit() {
    this.login = "Kapi123";
    this.service.getApartmentsOf(this.login).subscribe(response => {
      this.apartments = response;
    });
  }

}
