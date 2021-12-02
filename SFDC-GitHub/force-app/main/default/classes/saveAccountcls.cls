public class saveAccountcls {
    
    public string accountName{set;get;}
    public string accountType{set;get;}
    
    public pagereference saveAcc()
    {
        Account actobj = new Account();
        actobj.Name = accountName;
        actobj.Type = accountType;
        insert actobj;
        return new pagereference('/'+actobj.Id);
        
    }

}