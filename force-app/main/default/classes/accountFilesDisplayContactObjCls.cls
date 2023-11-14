public class accountFilesDisplayContactObjCls {

    public static void linkOppContentDocsToOrder(List<Contact> ordersToProcess){
        // Map constructor of parent Opportunity Ids to Opportunity, including relevant child Order records
        Map<Id, Account> oppIdToOpp = new Map<Id, Account>([SELECT Id, (SELECT Id, AccountId FROM Contacts)
                                                                    FROM Account 
                                                                    WHERE Id IN (SELECT AccountId from Contact WHERE Id IN :ordersToProcess)]);
        System.debug('Welcome');
        System.debug('Welcome'+oppIdToOpp);
        if(oppIdToOpp.size() > 0) {
            System.debug('Welcome New');
            //Create list of Opportunity Ids to use for LinkedEntityId filter on ContentDocumentLink query below
            List<Id> oppIds = new List<Id>(oppIdToOpp.keySet());
            
            //Create list of ContentDocumentLink records attached to the relevant parent Opportunities
            List<ContentDocumentLink> cdlList = [SELECT ContentDocumentId, LinkedEntityId FROM ContentDocumentLink WHERE LinkedEntityId IN :oppIds];
            
            if(cdlList.size() > 0) {
                System.debug('Welcome New one');
                List<Id> contentDocIds = new List<Id>();
                //Iterate through relevant Opportunity ContentDocumentLink list and add related ContentDocumentId to ContentDocumentId list
                for(ContentDocumentLink cdl: cdlList) {
                    contentDocIds.add(cdl.ContentDocumentId);
                }
                
                //Map constructor for Map of ContentDocument Ids to ContentDocuments
                //ITASSSOT-1332: added a condition 
                Map<Id, ContentDocument> cdIdToCd = new Map<Id, ContentDocument>([SELECT Id FROM ContentDocument WHERE Id IN: contentDocIds]);
                
                //Query for related Orders and existing ContentDocumentLink on those orders
                List<Contact> relatedOrderList = new List<Contact>();
                List<ContentDocumentLink> existingOrderCDLs = new List<ContentDocumentLink>();
                Map<String, ContentDocumentLink> linkedIdToCDL = new Map<String, ContentDocumentLink>();
                for(Id oppId : oppIds) {
                    relatedOrderList.addAll(oppIdToOpp.get(oppId).Contacts);
                }
                Set<Id> orderIds = new Set<Id>();
                
                if(relatedOrderList.size() > 0) {
                    System.debug('Welcome New Two');
                    for(Contact order : relatedOrderList) {
                        orderIds.add(order.Id);                     
                    }
                    existingOrderCDLs = [SELECT LinkedEntityId FROM ContentDocumentLink WHERE LinkedEntityId IN :orderIds];
                    
                    if (existingOrderCDLs.size() > 0) {
                        System.debug('Welcome New Three');
                        for(ContentDocumentLink existingCDL : existingOrderCDLs) {
                            linkedIdToCDL.put(existingCDL.LinkedEntityId, existingCDL);
                        }
                    }
                }           
                
                List<ContentDocumentLink> CDLsToInsert = new List<ContentDocumentLink>();
                //Iterate through cdlList of ContentDocumentLinks
                for(ContentDocumentLink cdl: cdlList) {
                    System.debug('Welcome New Four');
                    //Create variable for relevant ContentDocument
                    ContentDocument cd = cdIdToCd.get(cdl.ContentDocumentId);
                   
                    if(cd != null) {
                        System.debug('Welcome New Five');
                        //Create another ContentDocumentLink record on relevant ContentDocument to link it to child Order
                        Account opp = oppIdToOpp.get(cdl.LinkedEntityId);
                        for(Contact childOrder : opp.Contacts){  
                            if(!linkedIdToCDL.containsKey(childOrder.Id)) {     
                                ContentDocumentLink newCdl = new ContentDocumentLink();
                                newCdl.LinkedEntityId = childOrder.Id;
                                newCdl.ContentDocumentId = cd.Id;
                                CDLsToInsert.add(newCdl);
                            }
                        }
                    }
                }
                if(CDLsToInsert.size() > 0) {
                    System.debug('Welcome New Six');
                    system.debug('Hello'+CDLsToInsert);
                    list<Database.SaveResult> saveResults = Database.insert(CDLsToInsert, false);
            
                    /*list<Error_Log_c> logList = new list<Error_Log_c>();

                    for(Integer i = 0; i < saveResults.size(); i++) {
                        if(!saveResults.get(i).isSuccess()) {
                            // DML operation failed, get all errors
                            Database.Error error = saveResults.get(i).getErrors().get(0);String failedDML = error.getMessage();CDLsToInsert.get(i); //failed record from the list
                            Error_Log_c myLog = new Error_Logc(Error_Messagec = failedDML,Apex_Namec = 'OrderBizProcessHandler: linkOppContentDocsToOrder',Notify_Userc = system.UserInfo.getUserId(),Related_Record_c = CDLsToInsert.get(i).Id);
                            logList.add(myLog);
                        }               
                    }
                    if(logList.size()>0) {insert logList;}*/
                }
            }
        }
    }
}