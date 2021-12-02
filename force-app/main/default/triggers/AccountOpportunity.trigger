trigger AccountOpportunity on Account(after update,before insert){
   
    if(trigger.isUpdate && trigger.isAfter){
       System.debug('update entered..');
      // AccountopportunityClass.createOpportunities(trigger.newMap,trigger.oldMap);
  }
  
  
  
}