import { LightningElement, track, api, wire } from 'lwc';
import saveContacts from '@salesforce/apex/contactAccountCreateCustomCls.updateContacts';
import getContactList from '@salesforce/apex/contactAccountCreateCustomCls.getContactList';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import LeadSource from '@salesforce/schema/Contact.LeadSource';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class ContactCreationCustom extends NavigationMixin(LightningElement) {
    @api recordId;
    @track error;
    @track message;
    @track contactList;

   /*@wire(getContactList, { accountId: '$recordId' })
    wiredAccounts({ error, data }) {
        if (data) {
            this.contactList = data;
            console.log('Return Contact data:' + data);
        } else if (error) {
            this.contactList = error;
        }
    }*/
    handleRecordsLoad() {
        //alert(this.recordId);
        getContactList({accountId: this.recordId})
            .then(result => {
                this.contactList = result;
                console.log('Return Contact result:' + result);
                this.error=undefined;
            })
            .catch(error => {
                this.error = error;
                this.contactList=undefined;
            });
    }

    connectedCallback() {
       this.handleRecordsLoad();
    }

    @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
    contactInfo;

    @wire(getPicklistValues,
        {
            recordTypeId: '$contactInfo.data.defaultRecordTypeId',
            fieldApiName: LeadSource
        }
    ) leadSourceValues;

    /*handleChange(event) {
        this.value = event.detail.value;
    }*/
    
    changeHandler(event) {
        console.log('event.target.name:' + event.target.name);
        console.log('event.target.value:' + event.target.value);
        console.log('Access key:' + event.target.accessKey);
        console.log('id:' + event.target.id);
        //if(this.contactList[event.target.accessKey]){
            if (event.target.name == "contName"){
                 //this.contactList.Name == event.target.value;
                 this.contactList[event.target.accessKey].Name = event.target.value;
            }               
            else if (event.target.name == "contPhone") {
                //this.contactList.Phone == event.target.value;
                this.contactList[event.target.accessKey].Phone = event.target.value;
            }
            else if (event.target.name == "contLeadSource") {
                //this.contactList.LeadSource == event.target.value;
                this.contactList[event.target.accessKey].LeadSource = event.target.value;
            }
            else if (event.target.name == "contBirthdate") {
                //this.contactList.Birthdate == event.target.value;
                this.contactList[event.target.accessKey].Birthdate = event.target.value;
            }
            console.log('list value::'+JSON.stringify(this.contactList));
       // }
       
    }

    saveContactsHandler() {
        console.log('contactList:::' + this.contactList);
        console.log('contList:::' + JSON.stringify(this.contactList));
        saveContacts({ contList : this.contactList })
            .then(result => {
                this.message = result;
                this.error = undefined;    
               // this.contactList = {};       
                if (this.message !== undefined) {
                   
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title: 'Success',
                            message: 'Update Contact Successfully!!',
                            variant: 'success',
                        }),
                    );
                }
                console.log(JSON.stringify(result));
                console.log("result", this.message);

                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: this.recordId,
                        objectApiName: 'Account',
                        actionName: 'view'
                    },
                });
                eval("$A.get('e.force:refreshView').fire();");

            })
            .catch(error => {
                this.message = undefined;
                this.error = error;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error Updating records',
                        message: 'Please enter all the required fields',
                        variant: 'error',
                    }),
                );
                console.log("error", JSON.stringify(this.error));
            });
    }

    cancleChangeHandler() {
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