import { TestBed } from '@angular/core/testing';

import { todoService } from './todo.service';

describe('ServicesService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: todoService = TestBed.get(todoService);
    expect(service).toBeTruthy();
  });
});
