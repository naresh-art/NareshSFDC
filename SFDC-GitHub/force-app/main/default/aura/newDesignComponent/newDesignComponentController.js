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
   
    handleCreateLoad: function (component, event, helper) {
        // var fieldsList = component.get("value");
         var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
             "recordId": component.get('v.recordId')
       });
       /* acion.setcallback(this,function(response){
            var records = response.getReturnvalue('recordId');
            component.set("v.fieldsList",records)
        });
         $A.enqueueAction(action); */
    },
    
   /*loadRecords : function(component, event, helper) {      
         component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'}            
        ]);
        var objName = component.get("v.objectName");
		var action=component.get("c.retriveDetails");
        action.setParams({"sobjectName":objName});
        action.setCallback(this,function(response){
            var records = response.getReturnValue();
            component.set("v.recordsList",records);
        });
        $A.enqueueAction(action);
	},*/
    
    /*myAction : function(component, event, helper) {
        console.log('+++line1');
		var action = component.get("c.fieldApis");
         console.log('+++line2');
        action.setCallback(this,function(data){
            var response = data.getReturnValue();
             console.log('+++line3'+JSON.stringify(response));
            component.set("v.fieldsList",response);

            });
            $A.enqueueAction(action);

	}*/
       /*       doInit : function(cmp) {
    	// Initialize input select options
        var opts = [
            { "priority": "priority", label: "Option1", value: "opt1", selected: "true" },
            { "class": "optionClass", label: "Option2", value: "opt2" },
            { "class": "optionClass", label: "Option3", value: "opt3" }

        ];
        cmp.find("InputSelectDynamic").set("v.options", opts);
        
    },

	   onSingleSelectChange: function(cmp) {
         var selectCmp = cmp.find("InputSelectSingle");
         var resultCmp = cmp.find("singleResult");
         resultCmp.set("v.value", selectCmp.get("v.value"));
	 },*/
    doInit : function(component, event, helper) {
        var fieldsVar = component.get("v.fields");
        if(fieldsVar){
            var fieldsList = fieldsVar.split(','); 
             component.set("v.fieldArray",fieldsList);
        }        
        var titleField = component.get("v.titlefield");
        //alert(titleField);
        
        if(titleField){
            alert(titleField);
            var field = titleField;        
            //set key for values lookup
            var key = 'v.simpleRecord.'+field;            
            //use the key to lookup value returned in LDS
            var value = component.get(key);
            alert(value);
            //set the value to and attribute to be used in your component
           component.set('v.title', value); 	
        }
        
	},
});