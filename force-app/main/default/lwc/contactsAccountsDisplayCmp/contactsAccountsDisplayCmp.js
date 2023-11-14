import { LightningElement, api, wire, track } from 'lwc';
import CONTACT_NAME_FIELD from '@salesforce/schema/Contact.Name';
import CONTACT_EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import CONTACT_PHONE_FIELD from '@salesforce/schema/Contact.Phone';
import CONTACT_ACCOUNT_FIELD from '@salesforce/schema/Contact.AccountId';

import Account_NAME_FIELD from '@salesforce/schema/Account.Name';
import Account_PHONE_FIELD from '@salesforce/schema/Account.Phone';

import { getRecord } from 'lightning/uiRecordApi';
const FIELDS = [CONTACT_NAME_FIELD, CONTACT_EMAIL_FIELD, CONTACT_PHONE_FIELD, CONTACT_ACCOUNT_FIELD];
const AccFIELDS = [Account_NAME_FIELD, Account_PHONE_FIELD];
export default class ContactsAccountsDisplayCmp extends LightningElement{
    @api recordId;
    contact;
    name;
    phone;
    email;
    phone;
    accountId;

    account;
    accName;
    accPhone;
    accEmail;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    wiredRecord({ error, data }) {
        if (data) {
            this.contact = data;
            this.name = this.contact.fields.Name.value;
            this.phone = this.contact.fields.Phone.value
            this.email = this.contact.fields.Email.value;
            this.accountId = this.contact.fields.AccountId.value;
        }
    }
}