public with sharing class triggerOnFilesClass {
    public static void updateAccountFileInsert(List<contentDocumentLink> contDocumentList){
          set<Id> accountIdSet = new set<Id>();
          Map<Id,Account> accountMap = new Map<Id,Account>();
          for(contentDocumentLink contDocLinkObj:contDocumentList){
              if(contDocLinkObj.LinkedEntityId!=null && String.valueOf(contDocLinkObj.LinkedEntityId).startsWithIgnoreCase('001')){
                  accountIdSet.add(contDocLinkObj.LinkedEntityId);
              }
          }
          if(accountIdSet.size()>0){
              for(AggregateResult agResultobj:[select count(id) filecount,LinkedEntityId actId from contentDocumentLink
                          where LinkedEntityId in:accountIdSet group by LinkedEntityId]){
                     Account actObj = new Account(Id=(Id)agResultobj.get('actId'),Total_No_of_Files__c=(decimal)agResultobj.get('filecount'));
                     accountMap.put(actObj.Id,actObj);
              }
              if(accountMap.size()>0){
                  try{
                      update accountMap.values();
                  }
                  catch(Exception e){

                  }
              }
          }

    }
}