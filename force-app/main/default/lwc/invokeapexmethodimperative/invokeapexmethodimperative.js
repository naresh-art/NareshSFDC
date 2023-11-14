import { LightningElement } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
export default class Invokeapexmethodimperative extends LightningElement {
    contacts;
    error;
    handleClick() {
        getContactList()
        .then(result=>{
            this.contacts = result;
        })
        .catch(error=>{
            this.error=error;
        });

    }

}