import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {
  
  value = "0"; 
  firstNum = 0;
  secondNum = 0; 
  currentState = ""; 
  decimal = false; 
  newNum = 0; 

  numberGroups = [
    [7, 8, 9, 'x'], 
    [4, 5, 6, '-'], 
    [1, 2, 3, '+'], 
    [0, '.', 'clear','=']
  ];


  onButtonPress(input) {
    console.log(this.currentState); 
    console.log(this.firstNum);
    console.log(this.secondNum);

    //Delete the number 0 from value
    if(Number(input) && this.value.length === 1 && this.value === "0") {
      this.value = ""; 
    }

    //Add input to value 
    
    if (Number(input) || input == "0") {
      this.value += input;
    } else if (input == "." && this.decimal == false) {
      this.value += input; 
      this.decimal = true; 
    }
    

    //Non-Numeric Buttons 
    
    //Clear 
    if(input === "clear") {
      this.value = "0"; 
      this.firstNum = 0; 
      this.secondNum = 0; 
      this.currentState = ""; 
      this.decimal = false; 
    }

    //Multiply, Subtract, Plus
    if(input == "x" && this.currentState == "") {
      
      this.firstNum = parseFloat(this.value);
    

      this.currentState = "x";
      this.decimal = false;
      this.value = "0";

    } else if(input == "-" && this.currentState == "") {
      /*
      if(this.decimal == true) {
        this.firstNum = parseFloat(this.value);
      } else {
        this.firstNum = parseInt(this.value); 
      }
      */
     this.firstNum = parseFloat(this.value);

      this.currentState = "-";
      this.decimal = false;
      this.value = "0";

    } else if(input == "+" && this.currentState == "") {
      
      this.firstNum = parseFloat(this.value);
      
      this.currentState = "+";
      this.decimal = false;
      this.value = "0";

    } 

    //Equals
    if(input == "=") {

      this.secondNum = parseFloat(this.value);

      if(this.currentState == "x") {                  //Multiply
        this.newNum = this.firstNum * this.secondNum; 
        this.value = this.newNum.toFixed(2); 
      } else if(this.currentState == "-") {            //Subtract
        this.newNum = this.firstNum - this.secondNum; 
        this.value = this.newNum.toFixed(2); 
      } else if(this.currentState == "+") {            //Add
        this.newNum = this.firstNum + this.secondNum; 
        this.value = this.newNum.toFixed(2);  
      }




    }

  }

}
