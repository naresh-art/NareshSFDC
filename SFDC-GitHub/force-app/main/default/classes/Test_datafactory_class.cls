@isTest
public class Test_datafactory_class {
    public static Account prepareAccount(boolean isInsert){
        Account actobj = new Account();
        actobj.Name = 'NewClassTriggerTest';
        actobj.Industry = 'Engeneering';
        actobj.Type = 'Other';
        if(isInsert){
            insert actobj;
        }
        return actobj;
    }
    
}