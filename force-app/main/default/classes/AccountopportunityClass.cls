public with sharing class AccountopportunityClass {

    public static void OppStageNameInsert(List<Opportunity> oppList){

            set<Id> accountIdSet = new set<Id>();
            Map<Id,Integer> accountIdCountMap = new Map<Id,Integer>();
            for(Opportunity oppObj:oppList){
                if(oppObj.StageName=='Closed Won' && oppObj.AccountId!=null){
                    accountIdSet.add(oppObj.AccountId);
                }
            }

            //preparation of for existing stage name
         if(accountIdSet!=null && accountIdSet.size()>0){

         for(AggregateResult  agResultobj:[select count(id) countstage,AccountId from Opportunity 
                                          where AccountId in:accountIdSet and StageName='Closed Won' Group By AccountId  ]){
             
                  Account actObj = new Account();    
                  actObj.Id = (Id)agResultobj.get('AccountId');
                          
                 accountIdCountMap.put(actObj.Id,(Integer)agResultobj.get('countstage')); 

                   //accountIdOppMap.put(Opportunityobj.AccountId,Opportunityobj);
         }
         
         //Validation 
         for(Opportunity oppObj:oppList){

             if(oppObj.StageName=='Closed Won' && oppObj.AccountId!=null && accountIdCountMap.get(oppObj.AccountId)>=3){
                oppObj.addError('you can\'t create more than three closed won stage names, select different stage name');
             }
         }

    }
  }



   /* public static void createOpportunities(Map<Id,Account> newAccountMap,Map<Id,Account> oldAccountMap){
        List<Opportunity> opportunityList = new List<Opportunity>();
		for(Account actObj:newAccountMap.values())
        {
		    if(newAccountMap.get(actObj.Id).type!=oldAccountMap.get(actObj.Id).Type 
		        &&  newAccountMap.get(actObj.Id).type=='Prospect')
                {
		        System.debug('prospect entere...');
    			Opportunity oppObject = new Opportunity();
    			oppObject.AccountId = actObj.Id;
    			oppObject.Name = actObj.Name;
    			oppObject.StageName = 'Closed Won';
    			oppObject.CloseDate = System.today().addDays(1);
    			opportunityList.add(oppObject);
		    }
		}
		if(!opportunityList.isEmpty()){
			insert opportunityList;
		}
    }*/


}