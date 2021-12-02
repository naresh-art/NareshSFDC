trigger ContactDelete on Account (before insert) {
    list<string> myNames = new list<string>();
    for(Account a:trigger.new){
        myNames.add(a.name);
    }
    list<Contact> myContacts = [select id,name from Contact where name in :myNames];
    delete myContacts;
}