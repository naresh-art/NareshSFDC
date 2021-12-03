public class AcccountCreationByOwn
{
    public Account actobj{set;get;}
    //Adding coments GitHub update check
    //Adding Developer branch From Main Master Branch
    //Checking Update on Master Baranch
<<<<<<< HEAD
    //Checking Github
=======
    // creating Feature Branch
>>>>>>> 64fabc123b6369972e6b5a7a6cc9e7a8b41e9fa5
    public AcccountCreationByOwn()
    {
        actobj=new Account();
    }
    public pageReference saveAccount(){
        insert actobj;
        return new pageReference('/'+actobj.Id);
    }
}