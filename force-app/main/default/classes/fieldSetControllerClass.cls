public without sharing class fieldSetControllerClass  {  
    public fieldSetControllerClass ()  { 
    
    }
    @AuraEnabled(cacheable=true)
    public static list<Wrappercls> getFieldList() 
    {   
        list<Wrappercls> fieldList = new list<Wrappercls>();
        for(Schema.FieldSetMember memberObj:SobjectType.Contact.FieldSets.ContactRecordsFieldSet.getFields()){
            //fieldList.add(memberObj.getFieldPath());  
            Wrappercls wrapObj = new Wrappercls();
            wrapObj.fieldName = memberObj.getFieldPath();
            if(memberObj.getFieldPath() == 'AccountId'){
                wrapObj.isAccountId=true;
            }      
            else{
                wrapObj.isAccountId=false;
            }   
            fieldList.add(wrapObj);
        }
        System.debug(fieldList);
        return fieldList;
    }  
  
    public class Wrappercls{
        @Auraenabled 
        public String fieldName{set;get;}
        @Auraenabled  
        public boolean isAccountId{set;get;}
       
    }

}