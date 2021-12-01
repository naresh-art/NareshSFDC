trigger AccountPhoneupdate on Account (before update) {
    list<Id> idlist = new list<Id>();
    map<id,Account> oldmap=Trigger.oldMap;
    map<id,Account> newmap=Trigger.newMap;
    for(Id aid:oldmap.Keyset()){
        if(oldMap.get(aid).phone!=newmap.get(aid).phone){//edit data stired in aid variable
            idlist.add(aid);//it can store the record id's into list   
        }
        list<Contact> cons=[select otherphone,accountid from Contact where accountid IN:idlist];
        if(cons.size()>0){
            for(Contact c:cons){
                c.otherphone=newmap.get(c.accountid).phone;
            }
            update cons;
        }
        
    }
}