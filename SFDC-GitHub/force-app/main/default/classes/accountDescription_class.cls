@isTest
public class accountDescription_class 
{
    public Static testMethod void myTestTrigger()
    {
        list<Account> accs = new list<Account>();
        for(Integer i=0;i<200;i++)
        {
            Account a = new Account(name='testing'+i,Industry='Energy');
            accs.add(a);
        }
        insert accs; 
        
        list<Account> abc=[select name,Description from Account Where ID in :accs];  
        for(Account b:abc)
        {
            System.assertEquals(b.Description,'Energy Account'); 
        }   
    }
}