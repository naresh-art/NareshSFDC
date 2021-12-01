import { LightningElement, wire, track, api } from 'lwc';
import getFieldList from '@salesforce/apex/fieldSetControllerClass.getFieldList';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class FieldsetAccount  extends NavigationMixin(LightningElement) {
    @track fieldList;
    @track error;
    @api recordId;

    @wire(getFieldList)  accountRecords({ error, data }) {
        if (data) {
            this.fieldList = data;   
        } 
        else if (error) {
            this.error = undefined;
            
        }
    }

    handlleAccountCreate(event){
        const evt = new ShowToastEvent({
            title: "Contact create",
            message: "Record Id: " + event.detail.id,
            variant: "Success",
        });
        this.dispatchEvent(evt);

        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.detail.id,
                objectApiName:'Contact',
                actionName: 'view'
            },
        });
    } 
       
     handleCancel(event)
     {
        var url = window.location.href;
        var value = url.substr(0,url.lastIndexOf('/') + 1);
        window.history.back();
        return false;
        }

}