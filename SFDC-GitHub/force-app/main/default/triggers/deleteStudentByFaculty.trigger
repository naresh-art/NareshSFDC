trigger deleteStudentByFaculty on Faculty__c (After update) 
{
    list<id> idlist=new list<id>();
    Map<Id,Faculty__c> oldmap = Trigger.oldMap;
    Map<Id,Faculty__c> newmap = Trigger.newMap;
    for(Id did:oldMap.keySet()){
        if(oldMap.get(did).Gender__c=='Male' && newMap.get(did).Gender__c=='FeMale'){
            idlist.add(did);
        }
    }
    list<Student__c> stu= [select id from Student__c where Faculty__C IN:idlist];
    delete stu;
    
}