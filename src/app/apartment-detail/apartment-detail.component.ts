import { Component, OnInit } from '@angular/core';
import { ApartmentService } from '../apartment.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'po-apartment-detail',
  templateUrl: './apartment-detail.component.html',
  styleUrls: ['./apartment-detail.component.scss']
})
export class ApartmentDetailComponent implements OnInit {

  private id: string = undefined;
  public apartment: any = undefined;


  constructor(
    private activatedRoute: ActivatedRoute,
    private service: ApartmentService
  ) { }

  ngOnInit() {
    this.id = this.activatedRoute.snapshot.paramMap.get('id');
    this.service.getApartment(this.id).subscribe(response => {
      console.log(response);
      this.apartment = response;
    });
  }

}
