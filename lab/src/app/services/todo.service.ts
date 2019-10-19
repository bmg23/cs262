import { Injectable } from '@angular/core';
import { Storage } from '@ionic/storage'; 
import { Todo } from '../interfaces/todo'; 



@Injectable({
  providedIn: 'root'
})
export class TodoService {

  public todos: Todo[] = []; 
  
  constructor(private storage: Storage) {
   
  }

  //Added functions with no addition logic in lesson04

  load() {
    return new Promise((resolve) => {
      this.storage.get('todos').then((todos) => {
        if(todos != null) {
          this.todos = todos; 
        }

        resolve(true); 

      });
    }); 
  }

  save() { 
    this.storage.set('todos', this.todos);

  }

  getTodo(id) {
    return this.todos.find(todo => todo.id == id); 
  }

  addTodo(todo: Todo) {
    this.todos.push(todo); 
    this.save(); 
  }


}
