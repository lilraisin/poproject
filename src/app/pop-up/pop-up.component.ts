import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { BsLocaleService } from 'ngx-bootstrap/datepicker';

@Component({
  selector: 'po-pop-up',
  templateUrl: './pop-up.component.html'
})
export class PopUpComponent implements OnInit {
  date: Date = new Date();
  comment = '';

  constructor(public bsModalRef: BsModalRef, private localeService: BsLocaleService) { }

  ngOnInit() {
    this.localeService.use('pl');
  }

  reserve() {
    this.bsModalRef.hide();
  }
}
