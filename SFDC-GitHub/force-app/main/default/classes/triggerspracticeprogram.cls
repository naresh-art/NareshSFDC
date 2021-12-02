public class triggerspracticeprogram 
{
    public static void createContact(list<Account> acc)
    {
        List<Contact> con = new List<Contact>();
        for(Account ac : acc)
        {
            contact c = new contact();
            c.AccountId = ac.Id;
            c.LastName = ac.Name;
            con.add(c);
        }
        if(!con.isEmpty())
        {
            insert con;
        }
    }
    public static void createOpportunity(map<id,Account> newAccountMap, map<id,Account> oldAccountMap)
    {
        list<Opportunity> opp = new list<Opportunity>();
        for(Account acc : newAccountMap.Values())
        {
            if(newAccountMap.get(acc.id).Rating != oldAccountMap.get(acc.id).Rating && newAccountMap.get(acc.id).Rating=='Hot')
            {
                Opportunity op = new Opportunity();
                op.AccountId = acc.Id;
                op.Name = acc.Name;
                op.StageName = 'Prospecting';
                op.CloseDate = System.today();
                opp.Add(op);
            }
        }
            if(!opp.isEmpty())
            {
                insert opp;
            }
        }
}