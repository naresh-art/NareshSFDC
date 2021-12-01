public class cloningacctcontroller {
 
  public string copyrec{get;set;}
  
  
  public cloningacctcontroller ()
  {
   account ac = new account();
  }
  

public list<account> getacc()
{
 list<account> a =[select id,name from account order by name asc limit 5];
 return a;
}
list<contact> cons = new list<contact>();

public void cloning()
{
 account ac = [select name from account where id =: copyrec ];
 system.debug('---------------'+ac);
 account accopy = ac.clone(false);
 insert accopy;
 list<contact> con =  [select lastname from contact where accountid =: ac.id];
  for(contact c : con){
  contact concopy = c.clone(false);
   concopy.accountid = accopy.id;
   cons.add(concopy);
  }
  insert cons;
 
 
}

public void del()
{
account ac = new account();
  ac = [select name from account where id =: copyrec ];
  delete ac;
 system.debug('-----------'+ac);

}

}