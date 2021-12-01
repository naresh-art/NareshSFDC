public with sharing class contentDocumenttriggerClass {
    public static void updateAccountonFileDelete(List<ContentDocument> contDocumentList){
        set<Id> contentDocIdSet = new Set<Id>();
        Map<Id,Account> accountMap =  new Map<Id,Account>();
        set<id> accountIdSet = new Set<Id>();
        set<Id> contentDocLinkIdSet = new Set<Id>();
        for(ContentDocument contDocObj:contDocumentList){
            contentDocIdSet.add(contDocObj.id);
        }
        if(contentDocIdSet!=null && contentDocIdSet.size()>0){
            for(contentDocumentLink objConDoclink:[select id,LinkedEntityId from contentDocumentLink 
            where  contentDocumentId in: contentDocIdSet]){
                if(objConDoclink.LinkedEntityId!=null && String.valueOf(objConDoclink.LinkedEntityId).startsWith('001')){
                     contentDocLinkIdSet.add(objConDoclink.id);
                     accountIdSet.add(objConDoclink.LinkedEntityId);
                }
            }
            if(accountIdSet!=null && accountIdSet.size()>0){
             for(Account actObj:[select id,Total_No_of_Files__c,(select id from contentDocumentLinks where Id not in:contentDocLinkIdSet)
                           from Account where id in:accountIdSet]){
                      actObj.Total_No_of_Files__c = actObj.contentDocumentLinks.size();
                      accountMap.put(actObj.Id, actObj);
                }
                if(accountMap!=null && accountMap.size()>0){
                    update accountMap.values();
                }
            }
        }        
    }
}