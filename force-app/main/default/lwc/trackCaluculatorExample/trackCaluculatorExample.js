import { LightningElement, track } from 'lwc';

export default class TrackCaluculatorExample extends LightningElement {
 firstNumber=0;
 secondNumber=0;
 @track result=0;
handleChanges(event){
    if(event.target.name == 'fNumber'){
        this.firstNumber = event.target.value;
    
    }
    if(event.target.name == 'sNumber'){
        this.secondNumber = event.target.value;
    
    }
    this.result = parseInt( this.firstNumber) + parseInt( this.secondNumber);
}
}