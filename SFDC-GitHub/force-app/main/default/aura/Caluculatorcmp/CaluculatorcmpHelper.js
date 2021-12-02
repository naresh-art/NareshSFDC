({
	helperAdditionMethod : function(component, event) {
		var firstnumber = parseInt(component.get("v.fnumber"));
        var secondnumber = parseInt(component.get("v.snumber"));
  //      component.set("v.result",(firstnumber+secondnumber));
         var addition = component.get("c.caluculateValues");
        addition.setParams({"fstnumber":firstnumber,"secnumber":secondnumber});
        addition.setCallback(this,function(response){
           var addresult = response.getReturnValue();
             alert(addresult);
            component.set("v.result",addresult);
    });
    
    $A.enqueueAction(addition);
	}
})