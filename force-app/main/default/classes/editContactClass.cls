public with sharing class editContactClass {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String accountId) {
        return [SELECT Id, Name, Birthdate, LeadSource, Phone  FROM Contact WHERE AccountId = :accountId];
    }	

}