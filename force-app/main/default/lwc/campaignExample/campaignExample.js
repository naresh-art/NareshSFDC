import { LightningElement, wire, api, track} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getOpps from '@salesforce/apex/campaignExampleClass.getOpps';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import CAMPAIGNMEMBER_OBJECT from '@salesforce/schema/CampaignMember';
import STATUS_FIELD from '@salesforce/schema/CampaignMember.Status';
import createCampaignMember from '@salesforce/apex/campaignExampleClass.createCampaignMembers';
    
    const columns = [
    
    {label: 'Name',fieldName: 'Name',type: 'text',sortable: true},
    {label: 'AccountName',fieldName: 'AccountId',sortable: true}, 
    {label: 'LeadSource',fieldName: 'LeadSource',sortable: true},    
    {label: 'Email',fieldName: 'Email',sortable: true},
    
         ];
    
    export default class CampaignExample  extends NavigationMixin(LightningElement) {

        @api recordId;
        @wire(getObjectInfo, { objectApiName: CAMPAIGNMEMBER_OBJECT })

campaigndata;

        @wire(getPicklistValues,

            {
                recordTypeId: '$campaigndata.data.defaultRecordTypeId', 

                fieldApiName: STATUS_FIELD
    
            }
    
        )
        statusPicklist;


    handleChange(event) {

        this.value = event.detail.value;

    }


        @track value;
        @track error;
        @track data;
        @api sortedDirection = 'asc';
        @api sortedBy = 'Name';
        @api searchKey = '';
        result;
        @api hideCheckboxColumn;
        @track recordId;

        selectedRows = [];
        //selRows = [];


        
 
       @track value = '';

        @track popoupShowModal = false;
        @track campaignShowModal = false;
        @track subName;


        
        @track page = 1; 
        @track items = []; 
        @track data = []; 
        @track columns; 
        @track startingRecord = 1;
        @track endingRecord = 0; 
        @track pageSize = 5; 
        @track totalRecountCount = 0;
        @track totalPage = 0;
        
        @track preSelectedIds = [];
      
        @wire(getOpps, {searchKey: '$searchKey', sortBy: '$sortedBy', sortDirection: '$sortedDirection'})
        wiredAccounts({ error, data }) {
            if (data) {
            
                this.items = data;
                this.totalRecountCount = data.length; 
                this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize); 
                
                this.data = this.items.slice(0,this.pageSize); 
                let tempRecords = this.data;
                tempRecords = tempRecords.map( row => {
                return { ...row, AccountId: row.Account.Name};
            })
            this.data = tempRecords;
                this.endingRecord = this.pageSize;
                this.columns = columns;
    
                this.error = undefined;
            } else if (error) {
                this.error = error;
                this.data = undefined;
            }
        }
    
        previousHandler() {
            if (this.page > 1) {
                this.page = this.page - 1; 
                this.displayRecordPerPage(this.page);
            }
        }
    
        nextHandler() {
            if((this.page<this.totalPage) && this.page !== this.totalPage){
                this.page = this.page + 1; 
                this.displayRecordPerPage(this.page);            
            }             
        }
    
        displayRecordPerPage(page){
    
            this.startingRecord = ((page -1) * this.pageSize) ;
            this.endingRecord = (this.pageSize * page);
    
            this.endingRecord = (this.endingRecord > this.totalRecountCount) 
                                ? this.totalRecountCount : this.endingRecord; 
    
            this.data = this.items.slice(this.startingRecord, this.endingRecord);
            let tempRecords = this.data;
            tempRecords = tempRecords.map( row => {
                return { ...row, AccountId: row.Account.Name};
            })
            this.data = tempRecords;
    
            this.startingRecord = this.startingRecord + 1;
        }    
        
        sortColumns( event ) {
            this.sortedBy = event.detail.fieldName;
            this.sortedDirection = event.detail.sortDirection;
            return refreshApex(this.result);
            
        }
      
        handleKeyChange( event ) {
            this.searchKey = event.target.value;  
            return refreshApex(this.searchKey);
        }
       
        handleSelect( event ) {

            const selRows = event.detail.selectedRows;
            console.log( 'Selected Rows are ' + JSON.stringify ( selRows ) );
            if ( this.selectedRows.length < selRows.length ) {
    
                console.log( 'Selected' ); 
    
            }
            this.selectedRows = selRows;
    
        }
        clear (event){
            let newArray=[];
            console.log('+++SelectedRow'+JSON.stringify(event))
            const selectedPillId = event.detail.name;
            const AllPillsList = this.selectedRows; 
            console.log("Seledted Rows169" + JSON.stringify(AllPillsList)); 
            this.selectedRows.forEach(function(item, index, object){
                if (item.Id !== selectedPillId) {
                    newArray.push(item);
                }
            }, this);
          
            this.selectedRows = newArray;
            let CRIdArray = newArray.map(row => row.Id);
            this.preSelectedIds = CRIdArray;
            
        }

        openModal(event) {    
            // to open modal window set 'bShowModal' tarck value as true
            
            if(this.selectedRows.length >= 1)
            {
                this.popoupShowModal = true;
                /*const naresh = event.detail.selectedRows;
                    for (let i = 0; i < naresh.length; i++){
                            console.log("You selected: " + naresh[i].contactName);
                       }*/
            }
            else
            {
                const evt = new ShowToastEvent({
                    title: "Error",
                    message: " Select at least one record and try again." , 
                    variant: "error",
                });
                this.dispatchEvent(evt);
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: event.detail.id,
                        objectApiName:'Campaign',
                        actionName: 'view'
                    },
                });
            }
            

        }
     

        closeModal() {    
            // to close modal window set 'bShowModal' tarck value as false
            this.popoupShowModal = false;
        }

        openCampaignModal() {    
            // to open modal window set 'bShowModal' tarck value as true
            this.campaignShowModal = true;
        }

        closeCampaignModal() {    
            // to open modal window set 'bShowModal' tarck value as true
            this.campaignShowModal = false;
        }
        get options() {
            return [
                { label: 'Keep member status', value: 'option1' },
                { label: 'Overwrite member status', value: 'option2' },  //The selected records are already members of
            ];
        }

        handlleCampaign(event){
            const evt = new ShowToastEvent({
                title: "newCampaign was successfully updated.",
                message:  "Record Id:" + event.detail.id,   
                variant: "Success",
            });
            this.dispatchEvent(evt);
            this[NavigationMixin.Navigate]({
                type: 'standard__recordPage',
                attributes: {
                    recordId: event.detail.id,
                    objectApiName:'Campaign',
                    actionName: 'view'
                },
            });
        } 

        handleNewmember() {
            createCampaignMember({ campaignId: this.recordId,contactList:this.selectedRows })
                .then(result => {
                    const evt = new ShowToastEvent({
                        title: 'Success',
                        message: 'campaign Members added Successfully',
                        variant: 'Success',
                    });
                    this.dispatchEvent(evt);
                })
                .catch(error => {
                    const evt = new ShowToastEvent({
                        title: 'error',
                        message: 'There is some issue while adding members.Please contact System Admnistrator',
                        variant: 'error',
                    });
                    this.dispatchEvent(evt);
                });
        }
        
    }