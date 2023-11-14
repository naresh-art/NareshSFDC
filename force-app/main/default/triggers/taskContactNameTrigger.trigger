trigger taskContactNameTrigger on Task(before Insert){
  /*Boolean isInsideSales = FeatureManagement.checkPermission('Demo_Custom_Permission');
    List<Contact> serviceList = new List<Contact>();
    Set<Id> serviceId = new Set<Id>();
      if(isInsideSales){
    if(trigger.isBefore && trigger.isInsert){
        for(Task taskObj:trigger.new){
            serviceId.add(taskObj.WhoId);
        }
        if(serviceId!=null && serviceId.size()>0){
            serviceList = [Select Id,Name from Contact where Id IN:serviceId];
            if(serviceList!=null && serviceList.size()>0){
                for(Task taskObj:trigger.new){
                    for(Contact REMSServiceObj:serviceList){
                        if(taskObj.WhoId==REMSServiceObj.Id){
                            taskObj.Contact_Name__c= REMSServiceObj.Name;
                        }
                    }
                }
            }
        }
    }
   }*/
   
   contactNamePopulationHandler customClass = new contactNamePopulationHandler();
    System.debug('customClass '+customClass .getIsFirstCustomPermission());
    
      if(customClass .getIsFirstCustomPermission()){
        if(trigger.isInsert && trigger.isBefore){
           contactNamePopulationHandler.taskProgramPopulation(Trigger.New); 
          }
      }
    
   /*if(trigger.isInsert && trigger.isBefore){
   contactNamePopulationHandler.taskProgramPopulation(Trigger.New); 
   }*/
}