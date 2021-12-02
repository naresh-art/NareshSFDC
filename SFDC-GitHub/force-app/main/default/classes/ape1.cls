public class ape1 {
    public list<Account> acclist{set;get;}
    public ape1(ApexPages.StandardController stdController)
        {
            acclist = new list<Account>();
            acclist = [select id,name,type,rating from Account limit 10];
        }
}