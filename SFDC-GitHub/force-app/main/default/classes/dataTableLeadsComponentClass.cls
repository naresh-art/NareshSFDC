public class dataTableLeadsComponentClass {
@AuraEnabled
    public static  List<Lead> getAccounts(Integer pageSize, Integer pageNumber, String firstName){
        Integer offset = (pageNumber - 1) * pageSize;
        List<Lead> conList = new List<Lead>();
        String firstNameKey = '%'+firstName+'%';
        conList = [SELECT Id, Name, AnnualRevenue, Industry, Email, Phone FROM Lead where Name like :firstNameKey LIMIT :pageSize OFFSET :offset];
        return conList;
    }
     
    @AuraEnabled
    public static void createCampaignMembers(Id campaignId, List<Lead> leadList){
        List<CampaignMember> newCampaignList = new List<CampaignMember>(); 
        for(Lead contObj: leadList){
            CampaignMember campObj = new CampaignMember();
            campObj.CampaignId = campaignId;
            campObj.LeadId = contObj.Id;
            campObj.Status = 'Sent';
            newCampaignList.add(campObj);
        }
        
        if(!newCampaignList.isEmpty()){
            insert newCampaignList;
        }
    }
    
    @AuraEnabled
    public static List<Lead> getRecentContacts(){
        List<Lead> contactList = new List<Lead>();
        contactList=[SELECT Id, Name,AnnualRevenue,LastViewedDate,Email,Phone,Industry FROM Lead WHERE LastViewedDate !=null ORDER BY LastViewedDate DESC limit 10];
    	return contactList;
    }
}