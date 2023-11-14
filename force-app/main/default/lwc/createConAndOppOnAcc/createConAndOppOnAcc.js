import { LightningElement, api, track, wire} from 'lwc';
//import saveOpportunities from '@salesforce/apex/AccountControllerCreation.getOpportunities';
//import saveContacts from '@salesforce/apex/AccountControllerCreation.getContacts';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
//import modal from "@salesforce/resourceUrl/customModel";
import { loadStyle } from "lightning/platformResourceLoader";

export default class CreateConAndOppOnAcc extends NavigationMixin(LightningElement) {
    @api recordId;
    keyIndex = 0;
    @track itemList = [{ id: 0}];

    @track showOpportunities = true;
    @track showContacts = false;
 
    /*connectedCallback() {
        loadStyle(this, modal);
    }*/

    addRow() {
        ++this.keyIndex;
        var newItem = [{ id: this.keyIndex }];
        this.itemList = this.itemList.concat(newItem);
    }
    removeRow(event) {
        if (this.itemList.length >= 2) {
            this.itemList = this.itemList.filter(function (element) {
                return parseInt(element.id) !== parseInt(event.target.accessKey);
            });
        }
    }
    
    handleOpportunitySubmit() {
        var isVal = true;
        this.template.querySelectorAll('lightning-input-field').forEach(element => {
            isVal = isVal && element.reportValidity();
        });
        if (isVal) {
            this.template.querySelectorAll('lightning-record-edit-form').forEach(element => {
                console.log('elementFields ::'+JSON.stringify(element.fields));  
                element.submit();
            });
            const toastEvent = new ShowToastEvent({
                title: 'Opportunity Sucess!',
                message: 'Opportunity Created Successfully!!',
                variant: 'success'
             });
             this.showOpportunities = false;
             this.showContacts = true;           
            eval("$A.get('e.force:refreshView').fire();"); 
           
        } else {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error creating record',
                    message: 'Please enter all the required fields',
                    variant: 'error',
                }),
            );
        }
    }

    handleOpportunityCancel(event)
    {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Account',
                actionName: 'view'
                  },
           });
        }

        handleContactSubmit() {
            var isVal = true;
            this.template.querySelectorAll('lightning-input-field').forEach(element => {
                isVal = isVal && element.reportValidity();
            });
            if (isVal) {
                this.template.querySelectorAll('lightning-record-edit-form').forEach(element => {
                    console.log('elementFields ::'+JSON.stringify(element.fields));
                    element.submit();
                });
                const toastEvent = new ShowToastEvent({
                    title: 'Contact Sucess!',
                    message: 'Contact Created Successfully!!',
                    variant: 'success'
                 });
                 this.dispatchEvent(toastEvent);  
                 this[NavigationMixin.Navigate]({
                  type: 'standard__recordPage',
                  attributes: {
                      recordId: this.recordId,
                      objectApiName: 'Account',
                      actionName: 'view'
                        },
                 });
            
                eval("$A.get('e.force:refreshView').fire();"); 
               
            } else {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: 'Please enter all the required fields',
                        variant: 'error',
                    }),
                );
            }
        }
        handleContactCancel(event)
        {
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: this.recordId,
                    objectApiName: 'Account',
                    actionName: 'view'
                      },
               });
            }

}