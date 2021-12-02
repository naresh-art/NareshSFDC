public with sharing class DisplayContact1 {
    public List<Contact> conList {get;set;}
    public DisplayContact1(ApexPages.StandardSetController controller) {

    }
    
    public PageReference ContactLists()
    {
    if(ApexPages.currentPage().getParameters().get('id') != null)
      conList = [Select id,Name,Phone,Email from contact where accountId =: ApexPages.currentPage().getParameters().get('id') ];
     return null;
    }   

}