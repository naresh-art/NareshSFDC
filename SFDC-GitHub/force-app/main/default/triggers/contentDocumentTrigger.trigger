trigger contentDocumentTrigger on ContentDocument (before delete) {
 if(trigger.isdelete && trigger.isBefore){
    contentDocumenttriggerClass.updateAccountonFileDelete(trigger.old);
 }
}