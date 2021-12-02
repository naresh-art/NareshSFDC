public class AccountActionsHandler {
    public static void createContacts(List<Account> accountList){
        List<Contact> contactList = new List<Contact>();	
    	for(Account actObj:accountList){
    		Contact contObj = new Contact();
    		contObj.AccountId = actObj.id;
    		contObj.LastName = actObj.Name;
    		contactList.add(contObj);	
    	}	
    	
    	if(contactList!=null && contactList.size()>0){
          //if(!contactList.isEmpty()){  
    		insert contactList;
    	}
    }
    public static void createOpportunities(Map<Id,Account> newAccountMap,Map<Id,Account> oldAccountMap){
        List<Opportunity> opportunityList = new List<Opportunity>();
		for(Account actObj:newAccountMap.values()){
		    if(newAccountMap.get(actObj.Id).type!=oldAccountMap.get(actObj.Id).Type 
		        &&  newAccountMap.get(actObj.Id).type=='Prospect'){
		            System.debug('prospect entere...');
    			Opportunity oppObj = new Opportunity();
    			oppObj.AccountId = actObj.Id;
    			oppObj.Name = actObj.Name;
    			oppObj.StageName = 'Prospecting';
    			oppObj.CloseDate = System.today().addDays(1);
    			opportunityList.add(oppObj);
		    }
		}
		if(!opportunityList.isEmpty()){
			insert opportunityList;
		}
    }
    
    public static void createCases(List<Account> accountList){
         List<Case> caseList = new List<Case>();
	   	for(Account actObj:accountList){
	   	    Case caseObj = new Case();
	   	    caseObj.Subject = 'Account :'+actObj.Name+' deleted';
	   	    caseObj.description = 'Account :'+actObj.Name+' deleted with type:'+actObj.Type;
	   	    caseObj.status = 'Open';
	   	    caseList.add(caseObj);
	   	}
	   	if(!caseList.isEmpty()){
	   	    insert caseList;
	   	}
    }
    public static void updateRating(List<Account> accountList){
        for(Account actObj:accountList){
	   	   if(actObj.Type=='Prospect'){
	   	       actObj.Rating = 'Hot';
	   	   }
	   	}
    }
    
}