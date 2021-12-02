public class buttonsprogram_class 
{

    public account acc {get;set;}

    public buttonsprogram_class(ApexPages.StandardController controller)
    {
    acc= new account();
    
     }     
     public pagereference save()
     {
     insert acc;
     pagereference pg = new pagereference ('/'+acc.id);
     return pg;
     }
     
     public pagereference savenew()
     {
     insert acc;
     pagereference pg = new pagereference ('/apex/showingstandardbutons');
     pg.setredirect(true);
     return pg;
     }
     
      public pagereference ref()
      {
    pagereference pg = new pagereference ('/apex/showingstandardbutons');
    pg.setredirect(true);
    return pg;
    }   
}