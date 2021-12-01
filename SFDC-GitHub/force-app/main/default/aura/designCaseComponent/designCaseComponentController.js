({
     handleClick : function (component, event, helper) {
        var buttonstate = component.get('v.buttonstate');
        component.set('v.buttonstate', !buttonstate);
    },
    
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
    navigateToHierarchyComp: function(component, event, helper) {       
        var currentRecordId = component.get('v.recordId');
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef: "sfa:hierarchyFullView",
            componentAttributes: {
                recordId: currentRecordId,
                sObjectName: component.get("v.sObjectName")
            }
        });
        evt.fire();
    },
    editRecord : function(component, event, helper) {
        var editRecordEvent = $A.get("e.force:editRecord");
        editRecordEvent.setParams({
             "recordId": component.get('v.recordId')
       });
        editRecordEvent.fire();
    },
    cloneRecord : function (component, event, helper) {
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
          "recordId": component.get('v.recordId'),
          "slideDevName": "detail"
        });
        navEvt.fire();
    },
    cloneURL : function (component, event, helper) {
        var urlEvent = $A.get("e.force:navigateToURL");
        urlEvent.setParams({
          "url": "/"+component.get('v.recordId')+"/e?clone=1"
        });
        urlEvent.fire();
    },
     clonewithSpecificFields : function (component, event, helper) {
        var createAcountContactEvent = $A.get("e.force:createRecord");
        createAcountContactEvent.setParams({
            "entityApiName": component.get("v.sObjectName"),
            "defaultFieldValues": {
                'Phone' : '415-240-6590',
                'AccountId' : '001xxxxxxxxxxxxxxx'
            }
        });
        createAcountContactEvent.fire();
    },
    onCancel : function(component, event, helper) {
        // Navigate back to the record view
        var navigateEvent = $A.get("e.force:navigateToSObject");
        navigateEvent.setParams({ "recordId": component.get('v.recordId') });
        navigateEvent.fire();
    }
    
})