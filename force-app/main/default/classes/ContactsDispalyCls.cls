public with sharing class ContactsDispalyCls {
    public ContactsDispalyCls() {
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        return [SELECT Id,Name, Phone, Email,AccountId FROM Contact LIMIT 1];
    }
}