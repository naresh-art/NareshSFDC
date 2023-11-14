public with sharing class contactNamePopulationHandler {
  
  public Boolean getIsFirstCustomPermission() {
        return FeatureManagement.checkPermission('Demo_Custom_Permission');
    }
    
  Public static void taskProgramPopulation(List<Task> taskList)
  {
     List<Contact> serviceList = new List<Contact>();
    Set<Id> serviceId = new Set<Id>();
        for(Task taskObj: taskList)
        {
            serviceId.add(taskObj.WhoId);
        }
        if(serviceId!=null && serviceId.size()>0){
            serviceList = [Select Id,Name from Contact where Id IN:serviceId];
            if(serviceList!=null && serviceList.size()>0){
                for(Task taskObj:taskList){
                    for(Contact REMSServiceObj:serviceList){
                        if(taskObj.WhoId==REMSServiceObj.Id){
                            taskObj.Contact_Name__c= REMSServiceObj.Name;
                        }
                    }
                }
            }
        }
    }
    
}