public class cnts {

    //public String document { get; set; }
   // public list<Account> accname { get; set; }
    public String accname { get; set; }
    public list<Contact> cons{set;get;}
   
   public PageReference clr() 
   {      
       show();
       set<id> ids = new set<id>();
       ids.clear();
       return null;
    } 


  public void show()
  {
     // list<Account> accname=[select id,name from Account];
      cons=[select id,lastName,firstname from Contact limit 10];
     // cons=[select id,name,(select lastname,firstname from Contacts) from Account];
     
  }
}