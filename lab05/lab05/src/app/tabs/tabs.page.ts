import { Component, OnInit } from '@angular/core';
import { Todo } from "../interfaces/todo"; 

 
@Component({
  selector: 'app-tabs',
  templateUrl: './tabs.page.html',
  styleUrls: ['./tabs.page.scss'],
})
export class TabsPage implements OnInit {

  private todo: any; 

  constructor() { 

    this.todo = {
      id : 0, 
      title : '', 
      description: ''

    };   

  }

  ngOnInit() {
  }

  saveToDo() {

  }

}

