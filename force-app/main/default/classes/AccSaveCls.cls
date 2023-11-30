public class AccSaveCls
{
 public Account actobj{get;set;}
 //New changes by Naresh
 public AccSaveCls()
  {
    actobj = new Account();
  }

 public pageReference saveacc()
 {
   insert actobj;
   return new pageReference('/'+actobj.Id);
  } 
  
 
}
