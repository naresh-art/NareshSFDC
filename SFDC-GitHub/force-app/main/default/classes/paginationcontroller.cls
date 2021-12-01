public class paginationcontroller 
{

 
  public list<account> acc {get; set;}
   // public list<contact> cons{set;get;}
  public integer totalrec{get;set;}
  public integer index =0;
  public integer blocksize = 5;
   
  public paginationcontroller()
  {
    totalrec = [select count() from account];
  }
  
  public list<account> getacct()
  {
    acc = [SELECT id,name,phone from account order by name limit :blocksize OFFSET :index];
    return acc;
  }
  
  public void begining()
  {
   index = 0;
  }
  
  public void previous()
  {
  index = index-blocksize;
  }
  
  public void next()
  {
  index = index+blocksize;
  }
  
  public void last()
  {
  index = totalrec-math.mod(totalrec,blocksize);
  }
  
  
   public boolean getOff() 
   {
    if((index+blocksize) > totalrec)
        return true;
        else
        return false;
    }


    public boolean getDis() 
    {
     if(index == 0)
        return true;
        else
        return false;
    }
 //list<contact> cons =new list<contact>();
    
  //public list<contact>  getrec(){
    
     
   //list<account> acc=[select id,name from account where name=:accname];
     //   for(integer i=0; i<acc.size(); i++){
       // ids.add(acc[i].id);
        //}
        
       //  cons = [select id,lastname from contact where accountid IN: ids];
   //system.debug('------------------------------------------>'+acc);
   
   //return cons;
   //}  
}