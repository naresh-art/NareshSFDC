public class QeryUtilcls {
    @Auraenabled
    public static List<sObject> retrieveDetails(String sobjectName){
        
        List<Sobject> sObjectList = new List<sObject>();
        String query = 'Select id, name from'+sobjectname+'limit 10';
        sObjectList  = database.query(query);
        return sObjectList;
    }
}