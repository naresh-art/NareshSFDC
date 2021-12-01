trigger CreateContactFromAccount on Account (After insert) {
   list<Contact> cons=new list<Contact>();
    for(Account a:trigger.new)
    {
        Contact c= new Contact();
        c.AccountId=a.Id;
        c.LastName=a.Name;
        c.Phone=a.Phone;
        cons.add(c);
    }
    insert cons;
}