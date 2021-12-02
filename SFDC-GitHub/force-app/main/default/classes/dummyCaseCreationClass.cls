public class dummyCaseCreationClass {

    @Auraenabled
    public static list<Case> retriveCaseDetails(String sfieldName){
        list<Case> caseList = new list<Case>();
        String query = 'select id'+sfieldName+'from Case limit 1';
        caseList = database.query(query);
            return caseList;
    }
    

}