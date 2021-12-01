import { LightningElement,api,wire } from 'lwc';

import { NavigationMixin } from 'lightning/navigation';

import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';

import {getRecord} from 'lightning/uiRecordApi';

import ACT_NAME from '@salesforce/schema/Account.Name';


const FIELDS = [ACT_NAME];

export default class NavToNewRecordWithDefaults extends NavigationMixin(LightningElement) {

    @api recordId;
    accountRec;
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    accountRecord({ error, data}){
        alert('hi');
        if(error){
            let errormessage = 'unknown error';
            if(Array.isArray(error,body)) {
                errormessage = error.body.map(e => e.message).join(',');

            } else if (typeof error.body.message === 'string'){
                errormessage = error.body.message;
            }
            this.dispatchEvent(
                new showToastEvent({
                    title: 'Error loading contact',
                    message: errmessage,
                    variant: 'error',
                }),
            );
        } else if(data) {
            this.accountRec = data;
            this.navigateToNewContactWithDefaults();
            //this.name = this.accountRec.fields.name.defaultValues;
        }
    }
    navigateToNewContactWithDefaults() {
       
        const act_name = this.accountRec.fields.Name.value?String(this.accountRec.fields.Name.value):'';
        //const act_name = this.accountRec.fields[act_name.fieldApiName].value?String(this.accountRec.fields[act_name.fieldApiName].value):'';
        
        const defaultValues = encodeDefaultFieldValues({


            LastName: act_name,
    
           AccountId:this.recordId            

        });



        console.log(defaultValues);



        this[NavigationMixin.Navigate]({

            type: 'standard__objectPage',

            attributes: {

                objectApiName: 'Contact',

                actionName: 'new'

            },

            state: {

                defaultFieldValues: defaultValues

            }

        });

    }

}