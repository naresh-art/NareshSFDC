public class AccRecExtensionCls {
    public List<Account> acclist{set;get;}
public AccRecExtensionCls(ApexPages.StandardController Controller){
    
    acclist = new List<Account>();
    acclist = [select Id ,Name,Type from Account limit 5];
}
}