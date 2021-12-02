public class childToParentRelation_class {
 public list<Contact> cons {set;get;}
    public Boolean flag1 {set;get;}
    public Boolean flag2 {set;get;}
    public void standardLookup(){
        flag1=true;
        flag2=false;
        cons=[select lastname,firstname,Account.name,Account.Industry from Contact];
    }
    public void customLookup(){
         flag1=false;
         flag2=true;
        cons=[select lastname,firstname,customAccount__r.name,customAccount__r.industry from Contact where customAccount__c!=''];
    }
}