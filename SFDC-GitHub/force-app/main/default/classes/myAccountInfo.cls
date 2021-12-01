@RestResource(urlMapping='/MyAccountDetails/*')
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
}