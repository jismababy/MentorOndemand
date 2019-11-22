import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AddmentorskillComponent } from './addmentorskill.component';

describe('AddmentorskillComponent', () => {
  let component: AddmentorskillComponent;
  let fixture: ComponentFixture<AddmentorskillComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AddmentorskillComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AddmentorskillComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
