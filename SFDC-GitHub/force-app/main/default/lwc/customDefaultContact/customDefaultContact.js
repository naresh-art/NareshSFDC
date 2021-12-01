import { LightningElement, api, wire, track } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
//import { getRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LASTNAME_FIELD from '@salesforce/schema/Account.Name';
import AccountName_FIELD from '@salesforce/schema/Account.Id';
//import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class CustomDefaultContact extends LightningElement {
// ApI name for App Builder setup
    

    }