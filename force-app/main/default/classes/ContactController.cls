public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT Id,Name, Title, Phone, Email
            FROM Contact            
            LIMIT 10];
    }
 

    @AuraEnabled(cacheable=true)
    public static List<Contact> findContactRecords(String searchKey) {
        String key = '%' + searchKey + '%';
        return [
            SELECT Id, LastName 
            FROM Contact 
            WHERE LastName LIKE :key 

            LIMIT 10];
    }
}