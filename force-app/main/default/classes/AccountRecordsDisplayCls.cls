public class AccountRecordsDisplayCls {
    public List<Account> acclist{set;get;}
    public AccountRecordsDisplayCls(ApexPages.StandardController stdController)
    {
        acclist = new List<Account>();
        acclist=[select id,name,type from Account limit 10];
    }
}