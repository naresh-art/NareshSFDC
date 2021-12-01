@isTest
private class newTriggerContactTestClass {
    private static testmethod void newTriggerContactTestMethod(){
        Account acc = new Account();
        acc.Name = 'newtestAccount';
        acc.type = 'Prospect';
        Test.startTest();
           insert acc;           // 1 DML operation(between two tests like start,stop)
        Test.stopTest();
        contact con = [select id,LastName from Contact where accountId =: acc.Id];
        System.assert(con.Id != null);
        System.assertEquals(acc.Name,con.LastName, 'Last name equals to account name');
    }
}