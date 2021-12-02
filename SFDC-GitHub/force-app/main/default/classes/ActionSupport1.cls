public class ActionSupport1 {

    public contact conObj;
    public ActionSupport1(ApexPages.StandardController controller)
    {
        conObj=(Contact)controller.getRecord();
    }
    public void UpdateContactDetails()
    {
        system.debug('Method is Calling with id===>'+conObj.Accountid);
       
        Account Varacc=[select id,name from Account where id=:conObj.Accountid];
        conObj.firstname=Varacc.name;
    }

}