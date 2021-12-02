public with sharing class contactWithSharingController {
    public list<contact> cons{get;set;}
     public ID accID1{get;set;}
    public string conid{get;set;}
    public string confirstname{get;set;}
    public contactWithSharingController (){
        cons= new list<contact>([select id,firstname, Phone FROM contact]);
    }
    public pagereference GoToDetailPage(){
        
        pageReference pg = new pageReference('/apex/GoToAnotherPage');
        pg.getParameters().put('conid',conid);
        pg.getParameters().put('confirstname',confirstname);
        pg.setRedirect(false);
        return pg;
    }        
       }