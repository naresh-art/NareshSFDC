import { LightningElement,wire} from 'lwc';
import retrieveContacts from '@salesforce/apex/ContactController.getContactList';

export default class Contactswithwireapex extends LightningElement {
    @wire(retrieveContacts) contactslist;
    contactrecords;
    error;
    @wire(retrieveContacts) contactsFunction({error,data}){
        if(data){
            console.log('Return Data:' +data);
            this.contactrecords = data;
            this.error = undefined;
        }
        else if(error){
            this.error = error;
            this.contactrecords = undefined;
        }
    }


}