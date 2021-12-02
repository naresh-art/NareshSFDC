public class AccountCreationbyUsingProperties 
{
    public String accName{set;get;}
    public String acctype{set;get;}
    
  /*  public string stuname{set;get;}
    public string fname{set;get;}
    public string addr{set;get;}
    public string faculty{set;get;}
    public string mname{set;get;}
    public string schoolname{set;get;}
    public string gender{set;get;}
    public string email{set;get;}
    public integer phone{set;get;}
    public integer roleno{set;get;}   */
    	
    	
    public pageReference saveAccount()
    {
        Account accobj = new Account();
      accobj.Name = accName;
        accobj.Type = accType;
        insert accobj;
       return new pageReference('/'+accobj.Id);
        
    
   /*     Student__c stu = new Student__c();
        stu.Name = stuname;
        stu.Father_Name__c = fname;
        stu.Address__c = addr;
        stu.Email__c = email;
        stu.Faculty__c = faculty;
        stu.Mother_Name__c = mname;
       // stu.Phone_Number__c = phone;
        stu.Student_Roll_No__c = roleNo;
        stu.School_Name__c = schoolname;
        stu.Gender__c = gender;
        insert stu;
        return new pageReference('/'+stu.Id);   */
    }
}