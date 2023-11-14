import { LightningElement, track,api, wire} from 'lwc';
import createEmployee from '@salesforce/apex/dep_emp_create_cls.createEmployee';

import { getPicklistValues } from 'lightning/uiObjectInfoApi';
//import LeadSource from '@salesforce/schema/Contact.LeadSource';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import Employee_OBJECT from '@salesforce/schema/Employee__c';

import Emp_Name from '@salesforce/schema/Employee__c.Name';
import Emp_BasicSalary from '@salesforce/schema/Employee__c.Basic_Salary__c';
import Emp_HRA from '@salesforce/schema/Employee__c.HRA__c';
import Emp_DA from '@salesforce/schema/Employee__c.DA__c';
import Emp_TA from '@salesforce/schema/Employee__c.TA__c';
import Emp_Birthdate from '@salesforce/schema/Employee__c.Birth_date__c';

import Emp_Status from '@salesforce/schema/Employee__c.Status__c';

import Emp_DepartmentName from '@salesforce/schema/Employee__c.Department_Name__c';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';


export default class Department_Employee_Creation extends NavigationMixin(LightningElement) {
   @api recordId;  
   //@track employeeId;
   @track error;
   @track employeeRecord = {
      [Emp_Name.fieldApiName]: '',
      [Emp_BasicSalary.fieldApiName]: '',
      [Emp_HRA.fieldApiName]: '',
      [Emp_DA.fieldApiName]: '',
      [Emp_TA.fieldApiName]: '',
      [Emp_Birthdate.fieldApiName]: '',
      [Emp_Status.fieldApiName]: '',
      [Emp_DepartmentName.fieldApiName]:this.recordId
   };
   @track employeeList;



   @wire(getObjectInfo, { objectApiName: Employee_OBJECT }) employeeInfo;

   @wire(getPicklistValues,
       {
           recordTypeId: '$employeeInfo.data.defaultRecordTypeId',
           fieldApiName: Emp_Status
       }
   ) statusValues;


   
   handleNameChange(event) {
      this.employeeRecord[Emp_Name.fieldApiName] = event.target.value;
   }
   handleBasicSalChange(event) {
      this.employeeRecord[Emp_BasicSalary.fieldApiName] = event.target.value;
   }
   handleHraChange(event) {
      this.employeeRecord[Emp_HRA.fieldApiName] = event.target.value;
   }
   handleDaChange(event) {
      this.employeeRecord[Emp_DA.fieldApiName] = event.target.value;
   }
   handleTaChange(event) {
      this.employeeRecord[Emp_TA.fieldApiName] = event.target.value;
   }
   handleBirthDateChange(event) {
      this.employeeRecord[Emp_Birthdate.fieldApiName] = event.target.value;
   }
   handleStatusChange(event) {
      this.employeeRecord[Emp_Status.fieldApiName] = event.target.value;
   }
   handleDepartmentNameChange(event){
     this.employeeRecord[Emp_DepartmentName.fieldApiName] = this.recordId;
  }


   handleChange(event) {
      if (event.target.name == 'empName') {
         this.employeeRecord[Emp_Name.fieldApiName] = event.target.value;
      }
      else if (event.target.name == 'empbasicsalary') {
         this.employeeRecord[Emp_BasicSalary.fieldApiName] = event.target.value;
      }
      else if (event.target.name == 'emphra') {
         this.employeeRecord[Emp_HRA.fieldApiName] = event.target.value;
      }
      else if (event.target.name == 'empda') {
         this.employeeRecord[Emp_DA.fieldApiName] = event.target.value;
      }
      else if (event.target.name == 'empta') {
         this.employeeRecord[Emp_TA.fieldApiName] = event.target.value;
      }
      else if (event.target.name == 'empBirthDate') {
         this.employeeRecord[Emp_Birthdate.fieldApiName] = event.target.value;
      }
      else if (event.target.name == 'empStatus') {
         this.employeeRecord[Emp_Status.fieldApiName] = event.target.value;
      }
      /*else if (event.target.name == 'Emp_DepartmentName') {
         this.employeeRecord[Emp_DepartmentName.fieldApiName] = this.recordId;
      }
      console.log('employeeRecord:::' + JSON.stringify(this.employeeRecord));*/
   }

   createEmployeeRecord() {
      console.log('employeeRecord:::' + this.employeeRecord);
      console.log('employeeRecord:::' + JSON.stringify(this.employeeRecord));
      this.employeeRecord[Emp_DepartmentName.fieldApiName] = this.recordId;
      createEmployee({employeeRecObj:this.employeeRecord})
         .then(result => {
            this.employeeRecord = {};
            const toastEvent = new ShowToastEvent({
               title: 'Success!',
               message: 'Employee Created Successfully!!',
               variant: 'success'
            });
            this.dispatchEvent(toastEvent);  
            this[NavigationMixin.Navigate]({
             type: 'standard__recordPage',
             attributes: {
                 recordId: this.recordId,
                 objectApiName: 'Department__c',
                 actionName: 'view'
                 
             }
            }); 
            eval("$A.get('e.force:refreshView').fire();"); 
         })
         .catch(error => {
            this.error = error.message;
         });

   }
}