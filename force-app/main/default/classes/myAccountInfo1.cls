@RestResource(urlMapping='/myAccount/*')
global class myAccountInfo1
{
@HttpGet
global static list<Account> getAccount()
{
list<Account> lstAcc;
try{
lstAcc = [select name,Phone from Account limit 5];
}
catch(Exception ex){
System.debug('Error'+ex.getMessage());
}
return lstAcc;
}
}