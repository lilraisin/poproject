import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OwnerApartmentDetailComponent } from './owner-apartment-detail.component';

describe('OwnerApartmentDetailComponent', () => {
  let component: OwnerApartmentDetailComponent;
  let fixture: ComponentFixture<OwnerApartmentDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OwnerApartmentDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OwnerApartmentDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
