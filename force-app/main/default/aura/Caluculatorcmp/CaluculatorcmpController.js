({
	addition : function(component, event, helper) {
    //  alert('Result is...');
	        //	var firstnumber = parseInt(component.get("v.fnumber"));    ====> (Apex controller code)
           //  var secondnumber = parseInt(component.get("v.snumber"));
  //     component.set("v.result",(firstnumber+secondnumber));   ================>(components code)
          //  var addition = component.get("c.caluculateValues");
         //  addition.setParams({"fstnumber":firstnumber,"secnumber":secondnumber});
        //  addition.setCallback(this,function(response){
        //     var addresult = response.getReturnValue();  =========> by using helper method write the code logic in
       //       alert(addresult);                             helper method and declare method in controller method
      //       component.set("v.result",addresult);
     // });
    
  //  $A.enqueueAction(addition);
    
    
    helper.helperAdditionMethod(component, event);
	}
})