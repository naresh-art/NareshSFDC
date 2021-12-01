@isTest
//private class @isTest
private class AccountActionsTestclass {

	private static testMethod void createContactsTest() {
            Account actObj = new Account();
            actObj.Name = 'Test Account';
            actObj.Type = 'Prospect';
            Test.startTest();
                insert actObj;
            Test.stopTest();
            Contact contObj = [select id,lastName from Contact where accountId=:actObj.Id];
            System.assert(contObj.id!=null);
            System.assertEquals(actObj.Name,contObj.LastName,'Last Name equals to account Name');
            
            
	}
	private static testMethod void createOpportunitiesTest(){
          Account actObj = new Account();
            actObj.Name = 'Test Account';
            insert actObj;
            actobj.Type = 'Prospect';
            Test.startTest();
                update actObj;
            Test.stopTest();
	}
	private static testMethod void createCasesTest(){
	        Account actObj = new Account();
            actObj.Name = 'Test Account';
            insert actObj;
            Test.startTest();
                delete actObj;
            Test.stopTest();
    }
	
}