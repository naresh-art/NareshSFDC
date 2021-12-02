({
	myAction : function(component, event, helper) {
        console.log('+++line1');
		var action = component.get("c.fieldApis");
         console.log('+++line2');
        action.setCallback(this,function(data){
            var response = data.getReturnValue();
             console.log('+++line3'+JSON.stringify(response));
            component.set("v.fieldsList",response);

            });
            $A.enqueueAction(action);

	},
    
    enableEdit : function(component, event, helper) {
		component.set("v.showEdit",true);
	},
    
    closeModel : function(component, event, helper) {
		component.set("v.showEdit",false);
	}
    
    
})