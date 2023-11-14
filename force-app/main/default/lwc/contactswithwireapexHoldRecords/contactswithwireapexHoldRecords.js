import { LightningElement,wire} from 'lwc';
import retrieveContacts from '@salesforce/apex/ContactController.getContactList';

export default class ContactswithwireapexHoldRecords extends LightningElement {
    @wire(retrieveContacts) contactslist;
   contactListRecords=[];
    error;
    @wire(retrieveContacts) contactsFunction({error,data}){
        if(data){
            alert('Hi');
            for(var i=2; i<data.length; i++){
                console.log(data[i]);
                //alert('Hello');
                this.contactListRecords.push({value:data[i].Name,key:i});
            }
            this.error = undefined;
        }
        else if(error){
            this.error = error;
            this.contactListRecords = undefined;
        }
   
}
}