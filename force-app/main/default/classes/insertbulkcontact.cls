public class insertbulkcontact 
{
    public Integer serialNo{set;get;}
    public list<Contact> cons{set;get;}
    public insertbulkcontact()
    {
        cons=new list<Contact>();
        //for(integer i=0; i<3; i++){
         //  cons.add(new contact());
       // }
    }
    public pagereference add()
    {
        cons.add(new Contact());
        return null;
    }
    public pagereference remo()
    {
        if(serialNo != null)
        {
            cons.remove(serialNo);
        }
      return null;
    }
    public pagereference sav()
    {
        return null;
    }
}