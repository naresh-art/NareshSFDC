import { LightningElement , track } from 'lwc';

export default class LwcDecoratorExample extends LightningElement {
    // @track greetings;   
     greetings;   

    handleGreetingChanges(event){
        this.greetings = event.target.value;
        console.log(this.greetings);
    }

}