@isTest
public class mybatchtest_class {
    public Static testmethod void mybatchtrig(){
        Account ab = new Account(name='testing');
        insert ab;
       //list<Account> acc = [select ID,name,Industry,Rating from Account where ID In :ab.id];
        batchApexHotquery_class instance = new batchApexHotquery_class();
        test.startTest();
          Database.executeBatch(instance,200);
        test.stopTest();
    }
}