import { Component, OnInit } from '@angular/core';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { BsLocaleService } from 'ngx-bootstrap/datepicker';
import { AnnouncementService } from '../announcement.service';

@Component({
  selector: 'po-pop-up',
  templateUrl: './pop-up.component.html'
})
export class PopUpComponent implements OnInit {
  id: string;
  date: Date = new Date();
  comment = '';

  constructor(
    public bsModalRef: BsModalRef,
    private localeService: BsLocaleService,
    private service: AnnouncementService
    ) { }

  ngOnInit() {
    this.localeService.use('pl');
  }

  reserve() {
    this.service.reserve({
      id: this.id,
      notka: this.comment,
      termin: this.date.toISOString().split('T')[0]
    }).subscribe(response => {
      console.log(response);
      this.bsModalRef.hide();
    });
  }
}
