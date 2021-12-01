trigger triggerOnFilesInsert on contentDocumentLink (after insert) {
if(trigger.isInsert && trigger.isAfter){
    triggerOnFilesClass.updateAccountFileInsert(trigger.new);
}
}