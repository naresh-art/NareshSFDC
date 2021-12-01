public class batchApexHotquery_class implements Database.Batchable<SObject> 
{
   
    public Database.QueryLocator Start(Database.BatchableContext bc)
    {
        String query = 'select name,industry,rating from Account';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, list<Account> scope)
    {
        list<Account> updatedList=new list<Account>();
        for(Account acc: scope)
        {
            acc.Rating='warm';
            acc.Industry='Energy';
            updatedList.add(acc);
        }
        update updatedList;
    }
    public void finish(Database.BatchableContext bc)
    {

    }     
}