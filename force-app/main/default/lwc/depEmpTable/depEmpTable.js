import { LightningElement,wire,track,api} from 'lwc';

        import getEmpList from '@salesforce/apex/DepEmpTableClass.getEmpList';

        const columns = [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'BasicSalary', fieldName: 'Basic_Salary__c', type: 'text'},    
            {label: 'HRA', fieldName: 'HRA__c', type: 'text'},
            {label: 'DA', fieldName: 'DA__c', type: 'text'},
            {label: 'TA', fieldName: 'TA__c', type: 'text'},
            {label: 'DepartmentName', fieldName: 'Department_Name__c', type: 'text'}
        ];
        export default class DepEmpTable extends LightningElement {
            tablecolumns = columns; 
            @api recordId;

            @wire(getEmpList, {depId:'$recordId'}) employee;
            
        
        }