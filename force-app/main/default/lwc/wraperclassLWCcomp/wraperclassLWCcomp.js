import { LightningElement,api,wire } from 'lwc';
import retrieveWraperRec from '@salesforce/apex/RetrieveAccountRelatedChildObjectsCntrl.getWrapperRecord';
export default class WraperclassLWCcomp extends LightningElement {
    @api recordId;
    wrapperRecord;
     @wire(retrieveWraperRec,{actRecordId:'$recordId'})
     wrapperRec({error,data}){
        this.wrapperRecord = data;
    }
}