public class wizard_class {
    
    Account a = new Account();
    Contact c = new Contact();
    Opportunity o = new Opportunity();
    
    public Account geta(){
        return a;
    }
     public Contact getc(){
        return c;
    }
     public Opportunity geto(){
        return o;
    }
    
    public pageReference gotopage11(){
        return page.page11;
    }
    
     public pageReference gotopage12(){
        return page.page12;
    }
    
     public pageReference gotopage13(){
        return page.page13;
    }
     public pageReference gotopage14(){
        return page.page14;
    }
    
    public pageReference Save_now(){
        insert a;
        c.AccountID = a.ID;
        insert c;
        o.AccountID = a.ID;
        insert o;
        return page.page15;
    }
}