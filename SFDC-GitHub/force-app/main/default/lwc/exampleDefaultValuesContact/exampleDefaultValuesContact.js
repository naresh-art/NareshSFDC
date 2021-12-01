import { LightningElement, track, wire, api } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class CreateContact extends LightningElement {

    @track statusOptions;
    @track value;
    @api objectApiName;

    @track objectInfo;
    @track value = 'Client User';
    
    @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT}) objectInfo;
    objectInfo;


    get recordTypeId1() {
        var recordtypeinfo = this.objectInfo.data.recordTypeInfos;
        var uiCombobox = [];
        console.log("recordtype" + recordtypeinfo);
        for(var eachRecordtype in  recordtypeinfo)//this is to match structure of lightning combo box
        {
          if(recordtypeinfo.hasOwnProperty(eachRecordtype))
          uiCombobox.push({ label: recordtypeinfo[eachRecordtype].name, value: recordtypeinfo[eachRecordtype].name })
        }
        console.log('uiCombobox' + JSON.stringify(uiCombobox));
      return uiCombobox;
    }

}