public with sharing class GoToAnotherPageController2_class {
    //public id oppassignid{get;set;}
    public string oppassignid{get;set;}
    public string oppassignName{get;set;}
    
    public PageReference gotooppdetailpage() 
    {
        system.debug('>>>>>>Id'+oppassignid);
        pagereference pg = new pagereference('/' +oppassignid);
        return pg;
    }

    public ID accID1{get;set;}
    public string conName1{get;set;}
    public contact con{get;set;}
    public list<Opportunity> cons = new list<Opportunity>();
    
    public GoToAnotherPageController2_class ()
    {
        accID1 = Apexpages.currentpage().getparameters().get('conid');
        conName1 = Apexpages.currentpage().getparameters().get('conName');
        //cons = [select id, lastName, firstname from contact where accountid =:accID1];
        system.debug('constructor contact recs ----------'+cons);  
        con = new Contact(Lastname = conName1);
        con.id = accID1;
    }
    public list<opportunity> getOpportunities()
    {
        //accID1 = Apexpages.currentpage().getparameters().get('accid');
        //accName1 = Apexpages.currentpage().getparameters().get('accName');
        
        cons = [select id, Name,stagename from Opportunity where id=:accID1];
        return cons;
    }
   /* public pageReference saveInline(){
        cons = [select id,Name,stagename from Opportunity where Contact__c =:accID1];
        system.debug('Mothod called----------');
        try{
            Update cons;
            system.debug('contact recs--------' +cons);
            
        }
        catch(exception e){
            apexpages.addmessage(new apexpages.message(apexpages.severity.error , e.getMessage()));
        }
        return null;
    }*/
}