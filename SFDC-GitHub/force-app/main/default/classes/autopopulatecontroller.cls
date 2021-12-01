public class autopopulatecontroller {

public contact con {get;set;}
 public account acc {get;set;} 

public autopopulatecontroller (){
  con = new contact();
}

public void autopop(){
acc = new account();
acc = [select id,name from account where id =: con.accountid];
con.account.name = acc.name;
}

  public void sav(){
   insert con;
  }
}