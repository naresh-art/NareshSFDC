public with sharing class exampleDesignClass {
 
        @Auraenabled
    Public static List<string> fieldApis(){
        List<string> fieldNameSet = new List<string>();
        
        for(Support_Tiers__mdt steobj: [select id,Field_Label__c,Field_Name__c from Support_Tiers__mdt]){
            fieldNameSet.add(steobj.Field_Name__c);
        }
                    return fieldNameSet;
    }

}