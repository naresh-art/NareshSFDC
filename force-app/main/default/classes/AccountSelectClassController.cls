public class AccountSelectClassController {
    public list<wrapAccount> wrapAccountList{set;get;}
    public list<Account> selectedAccounts{set;get;}
    public AccountSelectClassController(){
        if(wrapAccountList==Null)
        {
            wrapAccountList=new List<wrapAccount>();
            for(Account a:[select id,name,BillingState,phone from Account limit 10])
            {
                wrapAccountList.add(new wrapAccount(a));
            }
        }
    }
    public void processSelected(){
        selectedAccounts= new List<Account>();
        for(wrapAccount wrapAccountObj:wrapAccountList)
            {
                if(wrapAccountObj.selected==true){
                    selectedAccounts.add(wrapAccountObj.acc);
                }
            }
    }
    public class wrapAccount{
        public Account acc{set;get;}
        public Boolean selected{set;get;}
        public wrapAccount(Account a){
            acc = a;
            selected=false;
        }
    }
}