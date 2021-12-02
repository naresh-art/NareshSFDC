@isTest
private class NewAccontCreationControllerTestClass {
    private static testmethod void NewTestAccountcreation(){
        Account accountobj = Test_datafactory_class.prepareAccount(false);
        Test.startTest();
          NewAccontCreationControllerTest NewAccontCreationControllerTestobj = new NewAccontCreationControllerTest();
          NewAccontCreationControllerTestobj.act = accountobj;
          NewAccontCreationControllerTestobj.saveAccount();
        Test.stopTest();
        Account acc = [select id,Name from Account where Name='NewClassTriggerTest' limit 1];
        System.assert(acc.Id!=null);
    }
}