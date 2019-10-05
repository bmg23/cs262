import { Injectable } from '@angular/core';
import { Todo } from "../interfaces/todo"; 


@Injectable({
  providedIn: 'root' 
})
export class todoService {

  public todos: Todo[] = []; 

  constructor() { }

  load() {

  }

  save() {

  }

  getTodo() {

  }

  addTodo(todo) {

  } 
}
