public class WrapperExample 
{
 public List<AccountWrapper> AccountWrapperList{set;get;}
 public List<AccountWrapper> selectedWraperList{set;get;}
 public WrapperExample()
 {
     AccountWrapperList = new List<AccountWrapper>();
   
     AccountWrapper wrapObj1 = new AccountWrapper();
     wrapObj1.accountName = 'Test Corp';
     wrapObj1.accountType = 'Other';
     wrapObj1.isChecked = false;
     AccountWrapperList.add(wrapObj1);
     
     AccountWrapper wrapObj2 = new AccountWrapper();
     wrapObj2.accountName = 'Corp Test';
     wrapObj2.accountType = 'Other';
     wrapObj2.isChecked = false;
     AccountWrapperList.add(wrapObj2);
     
     for(Account actobj:[select id,Name,Type from Account limit 5])
     {
         AccountWrapper wrapperObj = new AccountWrapper();
         wrapperObj.accountName = actobj.Name;
         wrapperObj.accountType = actobj.Type;
         wrapperObj.isChecked = false;
         AccountWrapperList.add(wrapperObj);
     }
 }

public void displaySelectedRecords()
{
selectedWraperList = new List<AccountWrapper>();
    for(AccountWrapper wrapObj:AccountWrapperList)
    {
       
        if(wrapObj.isChecked)
        {
            
           selectedWraperList.add(wrapObj);
        }
    }
    
}

public class AccountWrapper

  {
    public Boolean isChecked{set;get;}

    public String accountName{set;get;}

    public String accountType{set;get;}
  }
}