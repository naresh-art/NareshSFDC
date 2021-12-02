public with sharing class ContactsWithSharingController {
    public list<Contact> Con{get;set;}
    public string conid{get;set;}
    public string conName{get;set;}
    
    public ContactsWithSharingController (){
        Con = new list<Contact>([select id, Name,LastName,FirstName from Contact]);
    }
    public pagereference GoToDetailPage(){
        //pageReference pg = Page.GoToAnotherPage;
        pageReference pg = new pageReference('/apex/Gotodetailpage');
        pg.getParameters().put('conid',conid);
        pg.getParameters().put('conName',conName);
        pg.setRedirect(false);
        return pg;
    }
}