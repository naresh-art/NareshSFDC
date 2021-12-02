public class rowGvlimitsapex_class 
{
     public void getDmlrowlimits()
     {
       list<Account> accss= new list<Account>();
       Account a = new Account(name='mits');
       insert a;
       List<Contact> cons = new List<Contact>();
       Contact c1=new Contact(lastname='aaa');  
       Contact c2=new Contact(lastname='bbb');  
       cons.add(c1);
       cons.add(c2);  
       insert cons;
      // delete cons;  
         for(integer i=0;i<10000;i++)
         {
             Account accs = new Account(name='tcs');
             accss.add(accs);
         }insert accss;
         
     }
}