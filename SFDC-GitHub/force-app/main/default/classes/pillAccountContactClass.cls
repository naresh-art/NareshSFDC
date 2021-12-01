public with sharing class pillAccountContactClass {
    public pillAccountContactClass() {

            }
            @AuraEnabled
            public static Contact createEmployee(Contact contactObj){
                try{
                    update contactObj;
                    return contactObj;
                }
                catch(Exception ex){
                    throw new AuraHandledException(ex.getMessage());
        
                }
                
            }
            
        
            
        }