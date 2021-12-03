public class parentToChildRelation_class {
    public list<Account> accs {set;get;}
    public Boolean flag1 {set;get;}
    public Boolean flag2 {set;get;}
    public void standardLookup(){
        flag1=true;
        flag2=false;
        accs=[select name,industry,(select lastname,firstname from Contacts where lastname='James') from Account where industry='Energy'];
    }
    public void customLookup(){
         flag1=false;
         flag2=true;
        accs=[select name,industry,(select lastname,firstname from Contacts__r) from Account where name='Reddy'];
    }
}