import { LightningElement,api,track } from 'lwc';
import getResults from '@salesforce/apex/pillExampleClass.getResults';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';


import updateContact from '@salesforce/apex/pillExampleClass.updateContact';
import CONTACT_ID from '@salesforce/schema/Contact.Id';
import CONTACT_ACCOUNTS from '@salesforce/schema/Contact.Accounts__c';


export default class PillExample extends NavigationMixin(LightningElement) {
    @api objectName = 'Account';
    @api fieldName = 'Name';
    @api Label;
    @track searchRecords = [];
    @track selectedRecords = [];
    @api required = false;
    @api iconName = 'standard:account'
    @api LoadingText = false;
    @track txtclassname = 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click';
    @track messageFlag = false;

    searchField(event) {

        var currentText = event.target.value;
        var selectRecId = [];
        for(let i = 0; i < this.selectedRecords.length; i++){
            selectRecId.push(this.selectedRecords[i].recId);
        }
        this.LoadingText = true;
        getResults({ ObjectName: this.objectName, fieldName: this.fieldName, value: currentText, selectedRecId : selectRecId })
        .then(result => {
            this.searchRecords= result;
            this.LoadingText = false;
            
            this.txtclassname =  result.length > 0 ? 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click slds-is-open' : 'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click';
            if(currentText.length > 0 && result.length == 0) {
                this.messageFlag = true;
            }
            else {
                this.messageFlag = false;
            }

            if(this.selectRecordId != null && this.selectRecordId.length > 0) {
                this.iconFlag = false;
                this.clearIconFlag = true;
            }
            else {
                this.iconFlag = true;
                this.clearIconFlag = false;
            }
        })
        .catch(error => {
            console.log('-------error-------------'+error);
            console.log(error);
        });
        
    }
    
   setSelectedRecord(event) {
        var recId = event.currentTarget.dataset.id;
        var selectName = event.currentTarget.dataset.name;
        let newsObject = { 'recName' : selectName };
        this.selectedRecords.push(newsObject);
        this.txtclassname =  'slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click';
        let selRecords = this.selectedRecords;
		this.template.querySelectorAll('lightning-input').forEach(each => {
            each.value = '';
        });
        const selectedEvent = new CustomEvent('selected', { detail: {selRecords}, });
       
        this.dispatchEvent(selectedEvent);
    }

    removeRecord (event){
        let selectRecId = [];
        for(let i = 0; i < this.selectedRecords.length; i++){
            if(event.detail.name !== this.selectedRecords[i].recId)
                selectRecId.push(this.selectedRecords[i]);
        }
        this.selectedRecords = [...selectRecId];
        let selRecords = this.selectedRecords;
        const selectedEvent = new CustomEvent('selected', { detail: {selRecords}, });
       
        this.dispatchEvent(selectedEvent);
    }

   
  
    /*handleSubmit(event) {
        event.preventDefault(); 
        /*var accountNames="";
        for(let i = 0; i < this.selectedRecords.length; i++){
            accountNames += this.selectedRecords[i].recName;
        }
        const fields = event.detail.fields;
        fields.Accounts__c = this.selectedRecords;
        fields.Description = this.recordId;
        
        //fields.Accounts__c = accountNames;
        console.log('selectedRecords:::' + this.selectedRecords);
        console.log('selectedRecords:::' + JSON.stringify(this.selectedRecords));
        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }

    
    handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: "Updated Successfully",
            message: "ser information has successfully been updated!",
            variant: "success"
        });
       this.dispatchEvent(evt);  
       this[NavigationMixin.Navigate]({
        type: 'standard__recordPage',
        attributes: {
            recordId: this.recordId,
            objectApiName: 'Contact',
            actionName: 'view'
        },
       }); 
       eval("$A.get('e.force:refreshView').fire();");  
    }*/

    @api recordId;
    @track error;
    @track contactRecord = {[CONTACT_ACCOUNTS.fieldApiName]: this.selectedRecords, 
        [CONTACT_ID.fieldApiName] : this.recordId 
    };


    updateContactRecord() {
        this.contactRecord[CONTACT_ACCOUNTS.fieldApiName] = this.selectedRecords;
        this.contactRecord[CONTACT_ID.fieldApiName] = this.recordId;
        console.log('contactRecord:::' + this.contactRecord);
        console.log('contactRecord:::' + JSON.stringify(this.contactRecord));
        updateContact({contactObj:this.contactRecord})
           .then(result => {
              this.contactRecord = {};
              const toastEvent = new ShowToastEvent({
                 title: 'Success!',
                 message: 'contact updated Successfully!!',
                 variant: 'success'
              });
              this.dispatchEvent(toastEvent);  
              this[NavigationMixin.Navigate]({
               type: 'standard__recordPage',
               attributes: {
                   recordId: this.recordId,
                   objectApiName: 'Contact',
                   actionName: 'view'
               },
              }); 
              eval("$A.get('e.force:refreshView').fire();"); 
           })
           .catch(error => {
              this.error = error.message;
           });
  
     }

    
}