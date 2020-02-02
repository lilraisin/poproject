import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApartmentService {

  constructor(private http: HttpClient) { }

  public getApartmentsOf(login: string): Observable<any> {
    return this.http.get('http://localhost/poproject/apartments.php',
      { params: { func: 'getApartmentsOf', owner_login: login } });
  }

  public getApartment(id: string): Observable<any> {
    return this.http.get('http://localhost/poproject/apartments.php',
      { params: { func: 'getApartment', apartment_id: id } });
  }
}
