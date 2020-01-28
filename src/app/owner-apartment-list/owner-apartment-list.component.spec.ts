import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OwnerApartmentListComponent } from './owner-apartment-list.component';

describe('OwnerApartmentListComponent', () => {
  let component: OwnerApartmentListComponent;
  let fixture: ComponentFixture<OwnerApartmentListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OwnerApartmentListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OwnerApartmentListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
