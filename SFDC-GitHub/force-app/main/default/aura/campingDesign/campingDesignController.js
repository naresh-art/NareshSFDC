({
	displayRecords : function(component, event, helper) {
		component.set('v.mycolumns', [
            {label: 'Name',fieldName: 'linkName', type: 'url', typeAttributes: {label: { fieldName:'Name'}, target:'_blank'}},
            {label: 'Industry' ,fieldName:'Industry', type:'text'},
            {label: 'Type', fieldName:'Type', type:'text'}
        ]);
        var action = component.get("c.GetLeads");
        action.setParams({
        });
        action.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCESS") {
                var recordList = response.getReturnValue();
                recordList.forEach(function(record){
                    record.linkName = '/'+record.Id;
                });
                component.set("v.campList",recordList);
            }
        });
        $A.enqueueAction(action);
	}
})