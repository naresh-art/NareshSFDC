public with sharing class searchEmployeeClass   {

    @AuraEnabled(Cacheable = true)
    public static list<Employee__c> retriveEmp(String strEmpName, string strLocation) {
        strEmpName = '%' + strEmpName + '%';
        strLocation = '%' + strLocation + '%';
        list<Employee__c> lstAccs = [SELECT  Id, Name, Basic_Salary__c, Emp_Location__c From Employee__c 
                                    WHERE Name LIKE :strEmpName OR Emp_Location__c LIKE :strLocation];

        if(lstAccs.isEmpty()) {
            throw new AuraHandledException('No Record Found..');
        }
        return lstAccs; 
    }
}