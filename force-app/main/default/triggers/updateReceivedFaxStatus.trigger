trigger updateReceivedFaxStatus on efaxapp__Sent_Fax__c (after update) {
    List<efaxapp__Received_Fax__c> recievedFaxList = new List<efaxapp__Received_Fax__c>();
    for(efaxapp__Sent_Fax__c sentObj:trigger.new){
        if(sentObj.efaxapp__Status__c=='Delivered'){
            system.debug('sentObj.name' +sentObj.name);
            efaxapp__Received_Fax__c recievedFaxObj =[select id, efaxapp__Sent_Fax__c,name,efaxapp__Account__c from
                                                       efaxapp__Received_Fax__c  where name=:sentObj.name];
            recievedFaxObj.efaxapp__Account__c=sentObj.efaxapp__Account__c;
           // recievedFaxList.efaxapp__Sent_Fax__c=
            recievedFaxList.add(recievedFaxObj);
        }
    }
    if(recievedFaxList!=null && recievedFaxList.size()>0){
        update  recievedFaxList;
    }
}