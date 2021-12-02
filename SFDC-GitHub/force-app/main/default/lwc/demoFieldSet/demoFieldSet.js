import { LightningElement, wire, track, api } from 'lwc';
import getFieldList from '@salesforce/apex/demoFieldSetClass.getFieldList';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class DemoFieldSet  extends NavigationMixin(LightningElement) {
    @track fieldList;
    @track error;
    @api recordId;
     
    @wire(getFieldList)  accountRecords({ error, data }) {
        if (data) {
            this.fieldList = data;
            
        } else if (error) {
            this.error = undefined;
            
        }
    }
    handlleAccountCreate(event){
        const evt = new ShowToastEvent({
            title: "Acccount create",
            message: "Record Id: " + event.detail.id,
            variant: "Success",
        });
        this.dispatchEvent(evt);
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.id,
                objectApiName: 'Account',
                actionName: 'view'
            },
        });
    } 

}