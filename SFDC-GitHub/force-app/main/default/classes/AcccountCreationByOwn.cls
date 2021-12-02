public class AcccountCreationByOwn
{
    public Account actobj{set;get;}
    //Adding coments GitHub update check
    //Adding Developer branch From Main Master Branch
    public AcccountCreationByOwn()
    {
        actobj=new Account();
    }
    public pageReference saveAccount(){
        insert actobj;
        return new pageReference('/'+actobj.Id);
    }
}