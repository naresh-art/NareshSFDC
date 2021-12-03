trigger Trigonstudent on Student__c(before insert){


 List<Student__c> studentlist=Trigger.new;
 set<String> emailset=new set<String>();


        for(Student__c s:studentlist){
        
              emailset.add(s.Email__c);
  
 }
 List<Student__c> duplicatestudentlist=[select s.name,s.email__c from Student__c   s where s.Email__c in : emailset];
 set<string> duplicateemailset=new set<string>();


 for(Student__c s:duplicatestudentlist){


    duplicateemailset.add(s.Email__c);
   }
   for(Student__c s:studentlist){


      if(duplicateemailset.contains(s.Email__c)) {


        s.Email__c.addError('Record already exist with some emailid');
           }
    }
}