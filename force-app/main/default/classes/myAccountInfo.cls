/*@RestResource(urlMapping='/MyAccountDetails/*')
global class myAccountInfo {
@HttpPost
global Static String doPost(String name, String phone, String AccountNumber){
Account accs = new Account();
accs.name=name;
accs.phone=phone;
accs.AccountNumber=AccountNumber;
insert accs;
return accs.id;
}
}*/
@RestResource(urlMapping='/MyAccountDetails/*')
global class myAccountInfo {
@HttpGet
global Static List<Account> getAccount(){
List<Account> lst;
    try{
        lst = [select Name,Phone from Account Limit 10];
    }
    Catch(exception ex){
        System.Debug('Error'+ex.getMessage());
    }
    return lst;
}
}