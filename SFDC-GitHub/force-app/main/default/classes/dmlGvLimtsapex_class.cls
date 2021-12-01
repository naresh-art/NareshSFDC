public class dmlGvLimtsapex_class 
{
    public void getDmllimit()
    {
        list<Account> accss= new list<Account>();
        Account a = new Account(name='Techmahendra');
        accss.add(a);
        
        Account a1 = new Account(name='Dsmart');
        accss.add(a1);
   
        for(integer i=0;i<100;i++)
        {
            Account a2 = new Account(name='vNsoftTech');
            accss.add(a2);
            
        }
        insert accss;
        
        List<Contact> cons = new List<Contact>();
        contact c = new Contact(lastName='Dady');
        cons.add(c);
       
        for(integer i=0;i<50;i++)
        {
            Contact c1 = new Contact(lastName='satya');
            cons.add(c1);
            
        }
        insert cons;
       
    }
}