public class designClass {
@Auraenabled
   public static List<sObject> retriveDetails(String sobjectName){
        List<sObject> sobjectList = new List<sObject>();
        String query = 'Select id,name from' +sobjectName+ 'limit 10';
        sobjectList = database.query(query);
        return sobjectList;
        
    }	
  @Auraenabled
   public static List<Case> retriveCaseFields(){
        List<Case> caseList = new List<Case>();
        String query = 'Select id,|Priority, Status from Case';
        caseList = database.query(query);
        return caseList;
        
    }	

/*@Auraenabled
    Public static List<string> fieldApis(){
        List<string> fieldNameSet = new List<string>();
        
        for(Support_Tiers__mdt steobj: [select id,Priority,Status from Case]){
            fieldNameSet.add(steobj.Field_Name__c);
        }
                    return fieldNameSet;
    }  */

}