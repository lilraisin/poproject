import { Component, OnInit } from '@angular/core';
import { AnnouncementService } from '../announcement.service';

@Component({
  selector: 'po-announcement-list',
  templateUrl: './announcement-list.component.html',
  styleUrls: ['./announcement-list.component.scss']
})

export class AnnouncementListComponent implements OnInit {

  announcements: Array<any> = undefined;
  constructor(private service: AnnouncementService) {}
  ngOnInit() {
    this.service.getAnnouncements().subscribe(response => {
      this.announcements = response;
    });
  }

}
