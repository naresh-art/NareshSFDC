public class capgeminicontroller {

  public account ac{get;set;}  
  public list<account> acc{get;set;}
  

  public void sav(){
  ac = new account();
  if(ac.phone==null || ac.phone ==''){
   apexpages.addmessage(new apexpages.message(apexpages.severity.confirm,'Please enter phone value'));
   acc = [select id,name from account limit 10];
  }
  
  }
}