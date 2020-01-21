import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AnnouncementService {

  constructor(private http: HttpClient) { }

  public getAnnouncements(): Observable<any> {
    return this.http.get('http://localhost/poproject/announcements.php', { params: { func: 'listAnnouncements' } });
  }

  public getAnnouncement(id: number): Observable<any> {
    return this.http.get('https://jsonplaceholder.typicode.com/posts/' + id);
  }
}
