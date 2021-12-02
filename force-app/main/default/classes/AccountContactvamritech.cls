public class AccountContactvamritech {
    
    
    public static void createContact(list<Account> accountList){
        List<Contact> conList = new List<contact>();
        for(Account acc :accountList){
            contact con = new Contact();
       con.AccountId=acc.Id;
        con.LastName=acc.Name;
            conList.add(con);
        }
        insert conList;
    }

}