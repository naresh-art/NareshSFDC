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
    dosave: function(component, event, helper) {
       // (component.find("inputfld"))));
        for(var inputCmp in component.find("inputfld")){
            console.log('++++'+inputCmp.get('value'));
        }
		var action = component.get("c.saveRecord");
         console.log('+++line2');
        action.setCallback(this,function(data){
            var response = data.getReturnValue();
             console.log('+++line3'+JSON.stringify(response));
            component.set("v.recordDetails",response);

            });
            $A.enqueueAction(action);

	}
    
})