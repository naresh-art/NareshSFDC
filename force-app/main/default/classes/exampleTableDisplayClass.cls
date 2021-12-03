public class exampleTableDisplayClass {

     //Get Account Records
    @AuraEnabled
    public static  List<Contact> getAccounts(Integer pageSize, Integer pageNumber, String FirstName){
        Integer offset = (pageNumber - 1) * pageSize;
         string firstnameKey = '%'+FirstName+'%';
        List<Contact> accList = new List<Contact>();
        accList = [SELECT Id, Name, Email, Phone FROM Contact LIMIT :pageSize OFFSET :offset ];
        return accList;
    }
     
    //Delete Account
    @AuraEnabled
    public static void deleteAccount(Contact acc){
        Delete acc;
    } 
    //Display Records
     @AuraEnabled
    public static List<Contact> findByName(String searchKey) {
        String name =  + searchKey + '%';
        return [SELECT Id, Name, Email, Phone FROM Contact WHERE name LIKE :name];
    }
    
    
}