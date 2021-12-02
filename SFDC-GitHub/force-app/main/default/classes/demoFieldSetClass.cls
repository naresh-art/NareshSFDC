public without sharing class demoFieldSetClass  {      
   
    public demoFieldSetClass () {     
    }

    @AuraEnabled(cacheable=true)
    public static list<String> getFieldList() {   
        list<string> fieldList = new list<string>();
        for(Schema.FieldSetMember memberObj:SobjectType.Account.FieldSets.AccountRecordsFieldSet.getFields()){
            fieldList.add(memberObj.getFieldPath());            
        }
        System.debug(fieldList);
        return fieldList;
    }   
}