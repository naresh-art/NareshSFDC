@isTest
public class triggerCreation1TestCls {
    public static testmethod void createContactTest(){
        Account acc = new Account();
        acc.Name = 'test Account';
        acc.Type = 'Prospect';
        Test.StartTest();
          insert acc;
        Test.stopTest();
        Contact c = [select id,lastName from Contact where accountid =: acc.Id];
        System.assert(c.id != null);
        System.assertEquals(acc.Name,c.LastName ,'last Name equals to account name');
        
    }
}