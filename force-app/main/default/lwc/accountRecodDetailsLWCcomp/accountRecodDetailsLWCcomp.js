import { LightningElement,api,wire} from 'lwc';
import retrieveAccountRec from '@salesforce/apex/RetrieveAccountDetailsCntrl.getAccountRecords';
export default class AccountRecodDetailsComp extends LightningElement {
    @api recordId;
    accountRecord;
    wrapperRecord;
    @wire(retrieveAccountRec,{accRecordId:'$recordId'}) accountRec({error,data}){
        this.accountRecord = data;       
    }
}