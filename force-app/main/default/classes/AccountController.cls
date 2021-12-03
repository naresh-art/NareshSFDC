public with sharing class AccountController {
    public AccountController() {

    }
    @AuraEnabled(cacheable=true)
   Public static list<Account> getAccounts(){
       return [select id,name,type,industry from Account limit 10];
   }
}