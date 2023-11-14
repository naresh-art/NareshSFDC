public with sharing class RetrieveAccountDetailsCntrl {
    public RetrieveAccountDetailsCntrl() {

    }
    @AuraEnabled(cacheable=true)
    public  static Account getAccountRecords(String accRecordId) {
        Account actObj =[SELECT Id,Name,Industry,Rating From Account Where Id=:accRecordId];
        return actObj;
        
    }
}