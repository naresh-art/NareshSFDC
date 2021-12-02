trigger AccOpportunity on Opportunity (before insert, after update) {

    if(trigger.isInsert && trigger.isBefore){
    
        AccountopportunityClass.OppStageNameInsert(trigger.new);
    }
    if(trigger.isUpdate && trigger.isAfter){
    
        AccountopportunityClass.OppStageNameInsert(trigger.new);
    }
}