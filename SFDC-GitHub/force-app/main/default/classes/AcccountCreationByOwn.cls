public class AcccountCreationByOwn
{
    public Account actobj{set;get;}
    public AcccountCreationByOwn()
    {
        actobj=new Account();
    }
    public pageReference saveAccount(){
        insert actobj;
        return new pageReference('/'+actobj.Id);
    }
}