Public with sharing class campaignExampleClass {  
  
    @AuraEnabled(cacheable=true)
    public static  List<Contact> getOpps(Integer pageSize, Integer pageNumber, String firstName){
        Integer offset = (pageNumber - 1) * pageSize;
        List<Contact> conList = new List<Contact>();
        String firstNameKey = '%'+firstName+'%';
        conList = [SELECT Id, Name, FirstName,Account.Name, LastName, Email FROM contact where Name like :firstNameKey LIMIT :pageSize OFFSET :offset];
        return conList;
    }

    //getOpps

    @AuraEnabled
    public static void createCampaignMembers(Id campaignId, List<Contact> contactList){
        List<CampaignMember> newCampaignList = new List<CampaignMember>(); 
        for(Contact contObj: contactList){
            CampaignMember campObj = new CampaignMember();
            campObj.CampaignId = campaignId;
            campObj.ContactId = contObj.Id;
            campObj.Status = 'Sent';
            newCampaignList.add(campObj);
        }
        
        if(!newCampaignList.isEmpty()){
            insert newCampaignList;
        }
    }

    @AuraEnabled
    public static List<Contact> getRecentContacts(){
        List<Contact> contactList = new List<Contact>();
        contactList=[SELECT Id, Name,LastName,LastViewedDate,Account.Name FROM Contact WHERE LastViewedDate !=null ORDER BY LastViewedDate DESC limit 10];
    	return contactList;
    }

              
 }