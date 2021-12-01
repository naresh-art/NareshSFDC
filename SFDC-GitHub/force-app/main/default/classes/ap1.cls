public class ap1 {
    public Account actobj{get;set;}
    public ap1()
    {
        actobj = new Account();
    }
    public pagereference saveAccount()
    {
        insert actobj;
        //return null;
        return new pagereference('/'+actobj.id);
    }
}