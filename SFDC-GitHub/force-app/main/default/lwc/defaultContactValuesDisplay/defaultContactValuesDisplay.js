import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';



const FIELDS = [
    'Account.Name',
    'Account.Id'
];
export default class DefaultValuesComponent extends NavigationMixin(LightningElement) {
   
   

    @api recordId;
    account;
    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredAccount({ error, data }) {
        console.log('+++this.account'+JSON.stringify(data));
        console.log('+++this.error'+JSON.stringify(error));
        if (data) {
            this.account = data;
            this.navigateToNewContactWithDefaults();
        } 
    }
    
    navigateToNewContactWithDefaults() {
        console.log('+++accountId'+this.account.fields.Name.value);
        console.log('+++Id'+this.account.fields.Id.value);
        const defaultValues = encodeDefaultFieldValues({
            LastName : this.account.fields.Name.value,
            AccountId: this.account.fields.Id.value
        });
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues,
                

            }
        });
    }
}