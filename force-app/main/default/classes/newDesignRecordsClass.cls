public class newDesignRecordsClass {
@Auraenabled
    public static List<Case> retriveDetails(String sobjectName){
        List<Case> sobjectList = new List<Case>();
       // String query = 'select id,name from' +sobjectName+ 'limit 10';
        
        //sobjectList = database.query(query);
       // return sobjectList;
      return [select status from Case];  
    }	
}