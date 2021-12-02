trigger AccountPhone on Contact (After insert)
 {
 list<Account> accs = new list<Account>();
    for(Contact c:trigger.new)
    {
     Account a = [select id,name from Account where id =:c.AccountId];
        a.phone=c.phone;
        a.name=c.LastName;
        accs.add(a);
    }
    update accs;
}