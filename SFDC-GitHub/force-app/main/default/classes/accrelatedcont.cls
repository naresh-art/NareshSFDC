public class accrelatedcont {
    public list<Account> accs {set;get;}
    public accrelatedcont()
    {
        accs=[select name,(select id,lastName,email,phone from Contacts)from Account limit 5];
    }
}