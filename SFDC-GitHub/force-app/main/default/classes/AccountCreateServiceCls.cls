global class AccountCreateServiceCls {
webservice static string actCreateService(String accountName, string type, string industry){

Account actobj = new Account();
actobj.Name=accountName;
actobj.Type=type;
actobj.Industry=industry;
insert actobj;
return actobj.id;
}
}