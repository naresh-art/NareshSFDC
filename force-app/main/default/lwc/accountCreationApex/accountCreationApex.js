import { LightningElement,track,wire } from 'lwc';
import createAccount from '@salesforce/apex/AccountCreationController.createAccount';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
//Import Account Fields
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_TYPE from '@salesforce/schema/Account.Type';
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';

export default class AccountCreationApex extends LightningElement {
    @track accountRecord = {
        [ACCOUNT_NAME.fieldApiName]:'',
        [ACCOUNT_INDUSTRY.fieldApiName]:'',
        [ACCOUNT_PHONE.fieldApiName]:'',
        [ACCOUNT_TYPE.fieldApiName]:''
    };
    selectedIndustry;
    selectedType;
    @wire(getPicklistValues, {
        recordTypeId: '012000000000000AAA',
        fieldApiName: ACCOUNT_INDUSTRY
    }) accountindustryValues;

    @wire(getPicklistValues, {
        recordTypeId: '012000000000000AAA',
        fieldApiName: ACCOUNT_TYPE
    }) accountTypeValues;
    
    handleNameChange(event){
        console.log('accout Record with Handle Change with change:'+JSON.stringify(this.accountRecord));
        this.accountRecord.Name = event.target.value;
    }
    handleTypeChange(event){
        this.accountRecord.Type = event.target.value;
    }
    handleindustryChange(event){
        this.accountRecord.Industry = event.target.value;
    }
    handlePhoneChange(event){
        this.accountRecord.Phone = event.target.value;
    }

    createAccountRecord(){
        createAccount({accountRec:this.accountRecord})
        .then(result=>{
            this.accountRecord = {};
            window.console.log('Result:::'+result.Id);
            const toastEvent = new ShowToastEvent({
                title: 'Success!',
                message: 'Account Created Successfully!!',
                variant: 'success'
            });
            this.dispatchEvent(toastEvent);
            winow.console.log('Result::'+JSON.stringify(result));
        }) .catch(error=>{
            this.error = error.message;
        });

    }
}