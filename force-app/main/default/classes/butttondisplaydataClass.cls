public with sharing class butttondisplaydataClass {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Type, Industry, Phone FROM Account LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id, Name,Phone,Email FROM Contact LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList() {
        return [SELECT Id, Name,StageName,CloseDate FROM Opportunity LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static List<Lead> getLeadList() {
        return [SELECT Id, Name,Email,Phone FROM Lead LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static List<Employee__c> getEmpList() {
        return [SELECT Id, Name,Basic_Salary__c,HRA__c,DA__c,TA__c  FROM Employee__c LIMIT 10];
    }
    @AuraEnabled(cacheable=true)
    public static List<Department__c> getDepList() {
        return [SELECT Id, Name,Establish_Date__c,Department_Location__c FROM Department__c LIMIT 10];
    }
}