public class scheduleApex_class implements schedulable
{
    public void execute(SchedulableContext sc)
    {
        list<Account> accs=new list<Account>();
        for(Integer i=0;i<100;i++)
        {
            Account a = new Account(name='Naresh It'+i);
            accs.add(a);
        }
        insert accs;
        messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
    }
}