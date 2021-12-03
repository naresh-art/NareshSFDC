({
	calculate : function(component, event, helper) {
		var fnumber = component.get("v.fnumber");
                                                               // alert(fnumber);  alert message
        var snumber = component.get("v.snumber");
                                                                 //  var result = component.find("Result");
                                                              //component.set("v.result",fnumber+snumber);
        var action=component.get("c.caluculateValues");
        
        action.setParams({"fstnumber":fnumber,"secnumber":snumber});
        
        action.setCallback(this,function(response){
            var state = response.getState();
                                                               //var valueFromResp = response.getReturnValue();
            if(state == "SUCCESS"){
                component.set("v.result",response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})