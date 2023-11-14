/*public with sharing class certificationsClass {
    @AuraEnabled(cacheable=true)
        public static Map<ID, String> getRelatedFilesByRecordId(String recordId) {
            // Get record file IDs        
            List<ContentDocumentLink> files = [SELECT ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = :recordId];         
            List<ID> fileIDs = new List<ID>();
            for (ContentDocumentLink docLink : files) {
                fileIDs.add(docLink.ContentDocumentId);
            }
     
            List<ContentVersion> docs = [SELECT ContentDocumentId, FileExtension, Title 
                FROM ContentVersion WHERE ContentDocumentId IN : fileIDs];
            Map<ID, String> mapIdTitle = new Map<ID, String>();
            for (ContentVersion docLink : docs) {
                mapIdTitle.put(docLink.ContentDocumentId, docLink.Title);
            }
            return mapIdTitle;
        }
}*/

public without sharing class certificationsClass {
    @AuraEnabled
    public static List<FileDetails> getAccounts(String recordId){
        try {
            User u = [SELECT id, ContactId, AccountId FROM User where Id =: Userinfo.getUserId()];
            Set<Id> contentDocIds = new Set<Id>();
            List<FileDetails> fileDetails = new List<FileDetails>();
            Map<String, String> fileByParentId = new Map<String, String>();
              for(ContentDocumentLink linkDetail : [SELECT Id, LinkedEntityId, ContentDocumentId FROM ContentDocumentLink
                                                         WHERE LinkedEntityId =: recordId]) {
                    contentDocIds.add(linkDetail.ContentDocumentId);
                    fileByParentId.put(linkDetail.ContentDocumentId, linkDetail.LinkedEntityId);
                }
                for(ContentDocument docDetail : [SELECT Id, Title FROM ContentDocument WHERE Id =: contentDocIds]) {
                    fileDetails.add(new FileDetails(docDetail.Id, docDetail.Title));
                }
                return fileDetails;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    public Class FileDetails {
        @AuraEnabled
        public string Id;
        @AuraEnabled
        public string fileName;
        public FileDetails(String recId, String fileName) {
            this.Id = recId;
            this.fileName = fileName;
        }
    }
}