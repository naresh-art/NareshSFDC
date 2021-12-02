/*public with sharing class AccordionControllerClass {
    @AuraEnabled(cacheable=true)
    public static List<Contact> findContactByAccountId(String accountId) {      
        return [
            SELECT Id, FirstName,LastName,Email,Phone FROM Contact  WHERE AccountId=:accountId LIMIT 10];
    }
}*/

public class AccordionControllerClass {
    @AuraEnabled(cacheable=true)
      public static List<Account> fetchAcc (id RecId){
          string query= 'SELECT Id, Name,(select id,Name,LastName,Email,Phone,LeadSource from contacts)'+
                  ' FROM Account where Id = :RecId';
          
           return Database.query( query );
          
      }  
  }