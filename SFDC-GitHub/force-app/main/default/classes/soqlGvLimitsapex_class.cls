public class soqlGvLimitsapex_class 
{
    public void getsoqllimit()
    {
        Map<id,Account> accMap = new Map<id,Account>([select id,name from Account]);
       // list<Account> a=[select id,name from Account];
        //list<Contact> c = [select id,lastName from Contact];
       // list<Opportunity> o =[select id,amount from Opportunity];
        //for(integer i=0;i<100;i++)
        //{
          //list<Account> acc = [select id,name from Account];    
        //}
    }
}