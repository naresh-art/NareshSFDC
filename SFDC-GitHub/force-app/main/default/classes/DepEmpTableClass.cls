public with sharing class DepEmpTableClass {
    public DepEmpTableClass() {

    }
    @AuraEnabled(cacheable=true)  
    public static List<Employee__c> getEmpList(String depId) {
        return [
        SELECT Id,Name, Basic_Salary__c,HRA__c,DA__c, TA__c, Department_Name__c 
           FROM Employee__c where Department_Name__c =: depId LIMIT 10
        ];
    }
    

}