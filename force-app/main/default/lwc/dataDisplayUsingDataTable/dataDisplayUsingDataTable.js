import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class DataDisplayUsingDataTable extends LightningElement {
    @track data;
    @track column = [
        {label: 'Label', filedName:'Name',type:'text'},
        {label: 'Phone', filedName:'Phone',type:'phone'},
        {label: 'Industry', filedName:'Inadustry',type:'text'},
    ];
    @wire (getAccounts) accountRecords({error,data}){

        if(data){
            this.data = data;
        }
        else if (error){
            this.data = undefined;
        }
    }
}