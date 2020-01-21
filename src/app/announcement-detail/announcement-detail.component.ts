import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { AnnouncementService } from '../announcement.service';

@Component({
  selector: 'po-announcement-detail',
  templateUrl: './announcement-detail.component.html',
  styleUrls: ['./announcement-detail.component.scss']
})

export class AnnouncementDetailComponent implements OnInit {
  private id: number = undefined;
  public announcement: any = undefined;

  constructor(private activatedRoute: ActivatedRoute, private service: AnnouncementService) { }

  ngOnInit() {
    this.id = +this.activatedRoute.snapshot.paramMap.get('id');
    this.service.getAnnouncement(this.id).subscribe(response => {
      this.announcement = response;
    });
  }

}
