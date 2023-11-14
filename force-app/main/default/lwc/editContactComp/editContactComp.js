import { LightningElement, api, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import getContactList from '@salesforce/apex/editContactClass.getContactList';
import {deleteRecord} from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';

export default class EditContactComp extends NavigationMixin(LightningElement) {
    @api recordId;
    keyIndex = 0;
    @track conList = [{ id: 0 }];

   
    @wire(getContactList,{accountId:'$recordId'}) 
        wiredAccounts({error,data}) {
            if (data) {
                this.conList = data;
            } else if (error) {
                this.conList = error;
            }
        }

    handleContactSubmit(event) {
        var isVal = true;    
        this.template.querySelectorAll('lightning-input-field').forEach(element => {
            isVal = isVal && element.reportValidity();
        });
        if (isVal) {        
                this.template.querySelectorAll('lightning-record-edit-form').forEach(element => {
                    element.submit();
                });
                const toastEvent = new ShowToastEvent({
                    title: 'Contact Sucess!',
                    message: 'Contact update Successfully!!',
                    variant: 'success'
                });;
                this.dispatchEvent(toastEvent);
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: this.recordId,
                        objectApiName: 'Account',
                        actionName: 'view'
                    },
                });
                  
            //eval("$A.get('e.force:refreshView').fire();");
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

    /*handleContactCancel() {
        tthis[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.recordId,
                objectApiName: 'Account',
                actionName: 'view'
            },
        });
    }*/

    handleContactDelete(event){
        this.recordId = event.target.value;
        deleteRecord(this.recordId) 
        .then(() =>{
           const toastEvent = new ShowToastEvent({
               title:'Record Deleted',
               message:'Record deleted successfully',
               variant:'success',
           })
           this.dispatchEvent(toastEvent);
           console.log('conlist:'+data)
           return refreshApex(data);
           
        })
        .catch(error =>{
            window.console.log('Unable to delete record due to ' + error.body.message);
        });
     }
    
     handleNavigate() {
        this[NavigationMixin.Navigate]({
            type: "standard__component",
            attributes: {
                componentName: "c__NavigateToLWC"
            },
            state: {
               // c__propertyValue: this.recordId,
            }
        });
    }
}