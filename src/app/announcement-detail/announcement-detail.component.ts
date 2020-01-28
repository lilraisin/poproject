import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AnnouncementService } from '../announcement.service';

import { PopUpComponent } from '../pop-up/pop-up.component';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';

@Component({
  selector: 'po-announcement-detail',
  templateUrl: './announcement-detail.component.html',
  styleUrls: ['./announcement-detail.component.scss']
})

export class AnnouncementDetailComponent implements OnInit {
  private id: number = undefined;
  public announcement: any = undefined;

  bsModalRef: BsModalRef;

  constructor(
    private activatedRoute: ActivatedRoute,
    private service: AnnouncementService,
    private modalService: BsModalService
  ) { }

  ngOnInit() {
    this.id = +this.activatedRoute.snapshot.paramMap.get('id');
    this.service.getAnnouncement(this.id).subscribe(response => {
      this.announcement = response;
    });
  }

  openReservationModal() {
    const initialState = {
      list: [
        'Open a modal with component',
        'Pass your data',
        'Do something else',
        '...'
      ],
    };
    this.bsModalRef = this.modalService.show(PopUpComponent, { initialState });
  }

}
