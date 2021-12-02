({
    handleClick : function (component, event, helper) {
        var buttonstate = cmp.get('v.buttonstate');
        cmp.set('v.buttonstate', !buttonstate);
    },
  
    editRecord : function(component, event, helper) {
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
             "recordId": component.get('v.recordId')
       });
        editRecordEvent.fire();
    },
    
    handleCreateLoad : function(component, event, helper) {
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
             "recordId": component.get('v.recordId')
       });
        editRecordEvent.fire();
    },
   
       
       
            
});