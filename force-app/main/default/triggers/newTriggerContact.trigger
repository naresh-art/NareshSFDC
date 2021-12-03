trigger newTriggerContact on Account (after insert) {
  // List<Account> acc = new List<Account>();
   List<Contact> con = new List<Contact>();
    for(Account actobj : trigger.new){
        contact conobj = new contact();
        conobj.AccountId = actobj.Id;
        conobj.LastName = actobj.Name;
        con.add(conobj);    
    } 
    if(!con.isEmpty()){
        insert con;
    }

}