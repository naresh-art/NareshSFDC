trigger AccountActions on Account(after insert,after update,before delete,before insert){
    //This block is used for creating conatact when account is inserted
    if(trigger.isInsert && trigger.isAfter){
        AccountActionsHandler.createContacts(trigger.new);
    }//End of creation of contact 
   if(trigger.isUpdate && trigger.isAfter){
       System.debug('update entered..');
    AccountActionsHandler.createOpportunities(trigger.newMap,trigger.oldMap);
  }
  
  if(trigger.isDelete && trigger.isBefore){
      AccountActionsHandler.createCases(trigger.old);
  }
  
  if(trigger.isInsert && trigger.isBefore){
      AccountActionsHandler.updateRating(trigger.new);
  }
  
}