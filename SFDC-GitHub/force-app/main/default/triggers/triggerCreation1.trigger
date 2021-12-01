trigger triggerCreation1 on Account (After insert) 
{
  List<Contact> con = new List<Contact>();
   for(Account acc:trigger.new)
   {
       contact c = new contact();
       c.AccountId = acc.Id;
       C.LastName = acc.Name;
       con.add(c);
   }
    if(!con.isEmpty()){
        insert con;
    }
}