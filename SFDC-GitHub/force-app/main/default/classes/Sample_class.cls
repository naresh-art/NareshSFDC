public class Sample_class {
    public List<WrapperClass> listWrapper {get;set;}
    
    public Sample_class() {
        List<Account> listAcct = [SELECT Name, Industry FROM Account LIMIT 100];
        
        if(listAcct.size() > 0) {
            listWrapper = new List<WrapperClass>();
            
            for(Account a : listAcct) {
                listWrapper.add(new WrapperClass(a));
            }
        }
    }
    
    public class WrapperClass {
        public Boolean checkBool {get;set;}
        public Account acct {get;set;}
        public WrapperClass(Account acct) {
            this.acct = acct;
        }        
    }
}