@isTest
public class accountDescriptionTrigTest_class
{
    public Static testMethod void mydescTrig()
    {
        List<Account> accs= new List<Account>();  //Create 200 Records on list Accs;
        for(Integer i=0;i<200;i++){
            Account a =new Account(name='TestTrig'+i,Industry='Energy');
            accs.add(a);
        }   
        insert accs;
        
        list<Account> insertData=[select id,name,Description from Account where Id IN:accs];  //Check whether Description Field Is there are not in Account
        For(Account a1: insertData){
            System.assertEquals(a1.Description, 'Energy Account'); //To assign Expected Data(checking Data) And Actual Data(Trigger Class Data );
        }
    }
}