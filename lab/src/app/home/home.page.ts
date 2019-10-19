import { Component } from '@angular/core';
import { TodoService } from '../services/todo.service'; 

//Lesson 03: Looked over @Component decorator, auto generated. 
@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})


export class HomePage {

  constructor(public todoService: TodoService) {
    
  }

}
