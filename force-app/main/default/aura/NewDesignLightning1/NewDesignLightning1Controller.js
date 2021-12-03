({
	caluculation : function(component, event, helper) {
		//alert('hi');
      //  var fnumber = parseInt(component.find("fnum").get("v.value"));
      //  var snumber = parseInt(component.find("snum").get("v.value"));  without attribute calling values
      //  alert('result is:');
      //  component.find("result").set("v.value",(fnumber+snumber));
  
        var firstNumber = parseInt(component.get("v.fnumber"));
         var secondNumber = parseInt(component.get("v.snumber"));
         component.set("v.result",(firstNumber+secondNumber));
    }
})