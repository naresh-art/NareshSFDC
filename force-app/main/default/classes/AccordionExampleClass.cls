public with sharing class AccordionExampleClass {

@AuraEnabled
public static List<Contact> showAccountsForAccordion(String accountId)
{
List<Contact> accList = [SELECT Id, Name,LastName,Email,Phone,LeadSource FROM Contact WHERE AccountId=:accountId LIMIT 5];
return accList;
}
}