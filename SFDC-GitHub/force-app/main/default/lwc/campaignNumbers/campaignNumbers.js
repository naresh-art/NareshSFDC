import { LightningElement, wire, api, track} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import getOpps from '@salesforce/apex/OpportunityController.getOpps';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import CAMPAIGNMEMBER_OBJECT from '@salesforce/schema/CampaignMember';
import STATUS_FIELD from '@salesforce/schema/CampaignMember.Status';
import createCampaignMember from '@salesforce/apex/Campingform.createCampaignMembers';
    
    const columns = [
   
    {label: 'Name',fieldName: 'Name',type: 'text',sortable: true},
    {label: 'AccountName',fieldName: 'AccountId',sortable: true}, 
    {label: 'LeadSource',fieldName: 'LeadSource',sortable: true},    
    {label: 'Email',fieldName: 'Email',sortable: true},

         ];
    
    export default class CampaignNumbers extends NavigationMixin(LightningElement) {

        @api recordId;
        @wire(getObjectInfo, { objectApiName: CAMPAIGNMEMBER_OBJECT })

campaigndata;

        @wire(getPicklistValues,

            {
                recordTypeId: '$campaigndata.data.defaultRecordTypeId', 

                fieldApiName: STATUS_FIELD,
                
    
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
        selRows = []; 
 
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
        @track array=[];
      
        @wire(getOpps, {searchKey: '$searchKey', sortBy: '$sortedBy', sortDirection: '$sortedDirection'})
        wiredAccounts({ error, data }) {
            if (data) {
            
                this.items = data;
                this.totalRecountCount = data.length; 
                this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize); 
                
                this.data = this.items.slice(0,this.pageSize); 
                
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
                
                this.array = this.selectedRows;

                this.displayRecordPerPage(this.page);
               
            }
            
        }
    
        nextHandler(event) {
            
            
            if((this.page<this.totalPage) && this.page !== this.totalPage){
                this.page = this.page + 1; 
              
               this.array = this.selectedRows;
               
                this.displayRecordPerPage(this.page);  
                          
            } 
           
                   
        }
    
        displayRecordPerPage(page){
    
            this.startingRecord = ((page -1) * this.pageSize) ;
            this.endingRecord = (this.pageSize * page);
            
            this.template.querySelector('lightning-datatable').selectedRows = this.preSelectedIds;
           

            this.endingRecord = (this.endingRecord > this.totalRecountCount) 
                                ? this.totalRecountCount : this.endingRecord; 
    
            this.data = this.items.slice(this.startingRecord, this.endingRecord, this.preSelectedIds);
            

           // console.log('++++infilter1'+this.data);
            //console.log('++++infilter1'+this.selectedRows);

            var preselectedNew = [];
            //console.log('+++this.data.length'+this.data.length);
            //console.log('+++this.selectedRows.length'+this.selectedRows.length);
            for( var i=this.data.length - 1; i>=0; i--){
                for( var j=0; j<this.selectedRows.length; j++){
                    if(this.data[i] && (this.data[i].Id === this.selectedRows[j].Id)){
                        preselectedNew.push(this.data[i]);
                    }
                }
            }
            console.log('+++preselectedNew'+preselectedNew);
            this.preselectedCurrent = preselectedNew;
            this.startingRecord = this.startingRecord + 1;
        }
    
            //this.startingRecord = this.startingRecord + 1;
           

      //  }    
        
        /*sortColumns( event ) {
            this.sortedBy = event.detail.fieldName;
            this.sortedDirection = event.detail.sortDirection;
            return refreshApex(this.result);
            
        }*/
      
        handleKeyChange( event ) {
            this.searchKey = event.target.value;  
            return refreshApex(this.searchKey);
        }

       
        /*handleSelect( event ) {

            const selRows = event.detail.selectedRows;
            console.log( 'Selected Rows are ' + JSON.stringify ( selRows ) );
            if ( this.selectedRows.length < selRows.length ) {
    
                console.log( 'Selected' );      
    
            }
            this.selectedRows = selRows;
            this.selectedRows.forEach(function(item, index, object){
               
                if(this.preSelectedIds && !this.preSelectedIds.includes(item.Id)){
                   this.preSelectedIds.push(item.Id);
                }
            }, this);
          
            console.log( 'Selected Rows are178 ' + JSON.stringify ( this.preSelectedIds ) );  
             
        }*/


        handleSelect( event ) {
            console.log('+++SelectedRow204'+JSON.stringify(event))
            
            const selRows = event.detail.selectedRows;
            console.log( 'Selected Rows are ' + JSON.stringify ( selRows ) );
            if ( this.selectedRows.length < selRows.length ) {
    
                console.log( 'Selected' ); 
    
            }
            this.selectedRows = selRows;
        
           // console.log('++++this.selectedRows215'+JSON.stringify(this.selectedRows));
            if(this.array.length>0){
                console.log('+++inIf');
                this.selectedRows = this.selectedRows.concat(this.array);

            }

            if(this.preselectedCurrent.length>0){
            let deselectedRecs = this.preselectedCurrent.filter(x => !selRows.includes(x));

           // console.log( 'Deselected Recs are ' + JSON.stringify( deselectedRecs ) );
            //console.log( 'Deselected Recs are ' + JSON.stringify( selRows) );
            var rowsFilter = this.selectedRows;
            var remainingRowsFilter = this.selectedRows;
            if(deselectedRecs.length>0){
            for(var rowObj=this.selectedRows.length;rowObj>=0;rowObj--){
                for(var deselObj in deselectedRecs){
                //console.log( 'Deselected Recs are ' + this.selectedRows[rowObj].Id);
                //console.log( 'Deselected Recs are ' + deselectedRecs[deselObj].Id);
                if(this.selectedRows[rowObj].Id == deselectedRecs[deselObj].Id){
                   // console.log('+++before splice'+rowsFilter.length);
                            rowsFilter.splice(rowObj, 1);
                            this.selectedRows=rowsFilter;

                }
                else if(this.selectedRows[rowObj].Id != deselectedRecs[deselObj].Id){
                    remainingRowsFilter.splice(rowObj, 1);
                    this.selectedRows=remainingRowsFilter;
                }
                }
            }
            //console.log('+++before assignment');
            //this.selectedRows = rowsremainingRowsFilterFilter;
            }
            }

            this.preselectedCurrent = selRows;
            if(this.selectedRows.length>0){
            var dups = [];
            var arr = this.selectedRows.filter(function(el) {
            // If it is not a duplicate, return true
            if (dups.indexOf(el.Id) == -1) {
                dups.push(el.Id);
                return true;
            }

            return false;
            
            });
            this.selectedRows = arr;
            console.log('+++after fiilter'+JSON.stringify(this.selectedRows));
            let CRIdArray = this.selectedRows.map(row => row.Id);
            this.preSelectedIds = CRIdArray;
            //console.log('++++this.preSelectedIds261'+JSON.stringify(this.preSelectedIds));
            //console.log('++++this.selectedRows262'+JSON.stringify(this.selectedRows));
            }
    
        }





        clear (event){
            let newArray=[];
            console.log('+++SelectedRow'+JSON.stringify(event))
            const selectedPillId = event.detail.name;
            const AllPillsList = this.selectedRows; 
            console.log("Seledted Rows276" + JSON.stringify(AllPillsList)); 
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
            
            if(this.selectedRows.length >= 1)
            {
                this.popoupShowModal = true;
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
            this.popoupShowModal = false;
        }

        openCampaignModal() {    
            this.campaignShowModal = true;
        }

        closeCampaignModal() {    
            this.campaignShowModal = false;
        }
        get options() {
            return [
                { label: 'Keep member status', value: 'option1' },
                { label: 'Overwrite member status', value: 'option2' },  
            ];
        }


        handleNewmember(event) {
            createCampaignMember({ campaignId: this.recordId,contactList:this.selectedRows })
                .then(result => {
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
                })
                .catch(error => {
                    const evt = new ShowToastEvent({
                        title: "error",
                        message:  'There is some issue while adding members.Please contact System Admnistrator',   
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
                });
        }
        
    }