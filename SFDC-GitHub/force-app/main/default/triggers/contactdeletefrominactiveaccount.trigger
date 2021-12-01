trigger contactdeletefrominactiveaccount on Account (After update)
{
    list<Id> idlist1 = new List<Id>();
    Map<id,Account> oldmap=Trigger.oldMap;
    Map<id,Account> newmap=Trigger.newMap;
    for(Id bid:oldMap.keySet()){
        if(oldMap.get(bid).Active__C=='Yes' && newMap.get(bid).Active__C=='No')
        {
             idlist1.add(bid);
        }
       // else {
         //   if(oldMap.get(bid).ownership=='Public' && newMap.get(bid).ownership=='Private')
           // {
             //    idlist1.add(bid);
            //}
        //}
   }
    list<Contact> cont=[select id from Contact where accountid IN:idlist1];
    delete cont;
    list<Opportunity> oppo=[select id from Opportunity where accountid IN:idlist1];
    delete oppo;
}