public with sharing class dep_emp_create_cls {
    public dep_emp_create_cls() {

            }
            @AuraEnabled
            public static Employee__c createEmployee(Employee__c employeeRecObj){
                try{
                    insert employeeRecObj;
                    return employeeRecObj;
                }
                catch(Exception ex){
                    throw new AuraHandledException(ex.getMessage());
        
                }
                
            }
            
        
            
        }