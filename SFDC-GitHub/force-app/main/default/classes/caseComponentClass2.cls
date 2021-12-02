public class caseComponentClass2 {
@Auraenabled
    Public static List<string> fieldApis(){
        List<string> fieldNameSet = new List<string>();
        
        for(caseRecordEdit__mdt steobj: [select id,Field_Label__c,Field_Name__c from caseRecordEdit__mdt]){
            fieldNameSet.add(steobj.Field_Name__c);
        }
                    return fieldNameSet;
    }
    @Auraenabled
    Public static case saveRecord(Case RecordDetail){
        insert RecordDetail;
        return RecordDetail;
        
        
    }
    
}