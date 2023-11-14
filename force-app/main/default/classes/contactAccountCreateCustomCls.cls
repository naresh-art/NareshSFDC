public with sharing class contactAccountCreateCustomCls {
            @AuraEnabled
            public static List<Contact> getContactList(String accountId) {
                return [SELECT Id, Name, Birthdate, LeadSource, Phone  FROM Contact WHERE AccountId=: accountId];
            }	
            
            @AuraEnabled
        public static List<Contact> updateContacts(List<Contact> contList) {
            system.debug('contList:'+contList);
            update contList;
            return contList;
    }
           
    }