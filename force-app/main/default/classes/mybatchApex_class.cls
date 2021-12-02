public class mybatchApex_class implements Database.Batchable<SObject>
{
    String query;
    String field;
    String value;
    
    public mybatchApex_class(String q, String f, String v)
    {
        Query = q;
        Field = f;
        Value = v;
    }
    public Database.QueryLocator Start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, list<SObject> scope)
    {
        for(SObject a:scope)
        {
            a.put(field,value);
           
        } 
          update scope;
    }
    public void finish(Database.BatchableContext bc)
    {
        
    }
}