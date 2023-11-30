//Acccount Creation Class
public with sharing class AccountCreationController {
    public AccountCreationController() {

    } 
    @AuraEnabled
    public static Account createAccount(Account accountRec){
        try{
            insert accountRec;
            return accountRec;
        }
        catch(Exception ex){
            throw new AuraHandledException(ex.getMessage());
        }
    }
}