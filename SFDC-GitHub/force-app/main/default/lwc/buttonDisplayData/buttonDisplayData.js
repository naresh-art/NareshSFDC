import { LightningElement , track} from 'lwc';
import getAccountList from '@salesforce/apex/butttondisplaydataClass.getAccountList';
import getContactList from '@salesforce/apex/butttondisplaydataClass.getContactList';
import getOpportunityList from '@salesforce/apex/butttondisplaydataClass.getOpportunityList';
import getLeadList from '@salesforce/apex/butttondisplaydataClass.getLeadList';
import getEmpList from '@salesforce/apex/butttondisplaydataClass.getEmpList';
import getDepList from '@salesforce/apex/butttondisplaydataClass.getDepList';

export default class ButtonDisplayData extends LightningElement {

    @track columns = [{label: 'Account name',fieldName: 'Name',type: 'text',sortable: true},
        {label: 'Type',fieldName: 'Type',type: 'text',sortable: true},
        {label: 'Industry',fieldName: 'Industry',type: 'text',sortable: true},
        { label: 'Phone',fieldName: 'Phone',type: 'phone',sortable: true},

       
    ];

    @track columns1 = [
        { label: 'Contact name', fieldName: 'Name', type: 'text' },        
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Email', fieldName: 'Email', type: 'text' },   
            
    ];

    @track columns2 = [
        { label: 'Opportunity name', fieldName: 'Name', type: 'text' },        
        { label: 'Stage', fieldName: 'StageName', type: 'text' },
        { label: 'CloseDate', fieldName: 'CloseDate', type: 'text' },       
    ]; 

    @track columns3 = [
        { label: 'Leads', fieldName: 'Name', type: 'text' },        
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Email', fieldName: 'Email', type: 'text' },       
    ]; 
    
    @track columns4 = [
        { label: 'Employee Name', fieldName: 'Name', type: 'text' },        
        { label: 'Basic_Salary', fieldName: 'Basic_salary__c', type: 'text' },
        { label: 'HRA', fieldName: 'HRA__c', type: 'text' }, 
        { label: 'DA', fieldName: 'DA__c', type: 'text' },
        { label: 'TA', fieldName: 'TA__c', type: 'text' }      
    ];  

    @track columns5 = [
        { label: 'Department Name', fieldName: 'Name', type: 'text' },        
        { label: 'Establish_Date', fieldName: 'Established_date__c', type: 'text' },
        { label: 'Department_Location', fieldName: 'Department_Location__c', type: 'text' }      
    ];  
 
    @track error;
    @track accList;   
    @track conList;
    @track oppList ;
    @track leadList ;
    @track empList;
    @track depList;

    @track lstSelectedAccs;
    @track lstSelectedConts;
    @track lstSelectedOpps;
    @track lstSelectedLeads;
    @track lstSelectedEmps;
    @track lstSelectedDepts;

    handleContact(){ 
        getContactList()
        
        .then(result => {

            this.conList = result;
            this.accList = undefined;
            this.oppList = undefined;
            this.oppList = undefined;
            this.empList = undefined;
            this.depList = undefined;
            
            
        })  
        .catch(error => {
            
            this.error = error;
        }) 
    }
    
    handleAccount(){  
        getAccountList()
        .then(result => {

            this.accList = result;
            this.conList = undefined;
            this.oppList = undefined;
            this.leadList = undefined;
            this.empList = undefined;
            this.depList = undefined;
            
            
        })  
        .catch(error => {
            
            this.error = error;
        }) 
    }

    handleOpportunity(){  
        getOpportunityList()
        .then(result => {

            this.oppList = result;
            this.accList = undefined;
            this.conList = undefined;
            this.leadList = undefined;
            this.empList = undefined;
            this.depList = undefined;
            
        })  
        .catch(error => {
            
            this.error = error;
        }) 
    }

    handleLeads(){  
        getLeadList()
        .then(result => {

            this.leadList = result;
            this.accList = undefined;
            this.conList = undefined;
            this.oppList = undefined;
            this.empList = undefined;
            this.depList = undefined;
        })  
        .catch(error => {
            
            this.error = error;
        }) 
    }
    
    handleEmployee(){  
        getEmpList()
        .then(result => {

            this.empList = result;
            this.accList = undefined;
            this.conList = undefined;
            this.oppList = undefined;
            this.leadList = undefined;
            this.depList = undefined;
           
            
            
            
        })  
        .catch(error => {
            
            this.error = error;
        }) 
    }
    handleDepartment(){  
        getDepList()
        .then(result => {

            this.depList = result;
            this.accList = undefined;
            this.conList = undefined;
            this.oppList = undefined;
            this.leadList = undefined;
            this.empList = undefined;
            
            
        })  
        .catch(error => {
            
            this.error = error;
        }) 
    }

    getSelectedAccounts() {
    var selectedAccounts =  this.template.querySelector("lightning-datatable").getSelectedRows();  
      console.log('selectedRecords are ',selectedAccounts);
      this.lstSelectedAccs = selectedAccounts;
    }
    getSelectedContacts() {
    var selectedContacts =  this.template.querySelector("lightning-datatable").getSelectedRows();  
    console.log('selectedRecords are ',selectedContacts);
    this.lstSelectedConts = selectedContacts;
     }
    getSelectedOpportunities() {
    var selectedOpportunities =  this.template.querySelector("lightning-datatable").getSelectedRows();  
    console.log('selectedRecords are ',selectedOpportunities);
    this.lstSelectedOpps = selectedOpportunities;
    }
    getSelectedLeads() {
    var selectedLeads =  this.template.querySelector("lightning-datatable").getSelectedRows();  
    console.log('selectedRecords are ',selectedLeads);
    this.lstSelectedLeads = selectedLeads;
    }
    getSelectedEmployees() {
    var selectedEmployees =  this.template.querySelector("lightning-datatable").getSelectedRows();  
    console.log('selectedRecords are ',selectedEmployees);
    this.lstSelectedEmps = selectedEmployees;
    }
    getSelectedDepartments() {
    var selectedDepartments =  this.template.querySelector("lightning-datatable").getSelectedRows();  
    console.log('selectedRecords are ',selectedDepartments);
    this.lstSelectedDepts = selectedDepartments;
    }
}