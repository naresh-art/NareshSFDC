({
	loadRecords : function(component, event, helper) {
	
        component.set('v.columns', [
            { label : 'Name', fieldName: 'Name', type: 'text' }
        ]);
         var objNmae = component.get("v.objectName");
        var action=component.get("c.retrieveDetails");
        
        action.setParams({"sobjectName":objNmae});
        action.setCallback(this,function(response){
         var records = response.getReturnValue();
        component.set("v.recordsList",records);
        });
        $A.enqueueAction(action);
	}
})