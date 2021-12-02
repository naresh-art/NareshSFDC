trigger triggerPracticeProgramLogic on Account (after insert, after update) {
    if(trigger.isinsert && trigger.isafter){
        triggerspracticeprogram.createContact(trigger.new);
    }
    if(trigger.isupdate && trigger.isafter){
        triggerspracticeprogram.createOpportunity(trigger.newmap,trigger.oldmap);
    }
}