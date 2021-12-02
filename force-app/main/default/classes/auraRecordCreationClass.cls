public class auraRecordCreationClass {
@auraEnabled
    public static string auraContactCreation(Contact conObj){
        system.debug('contact::'+conObj.FirstName);
        insert conObj;
        return conObj.Id;
    }
}