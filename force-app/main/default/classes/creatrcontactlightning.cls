public class creatrcontactlightning {
	@Auraenabled
    public static string createContact(Contact contObj)
    {
        System.debug('contact::'+contObj.firstName);
        insert contObj;
		return contObj.Id;        
    }
@auraenabled
    public static list<Contact> retriveContacts(){
        return [select id,FirstName,LastName,phone from Contact ase limit 5];
    }
}