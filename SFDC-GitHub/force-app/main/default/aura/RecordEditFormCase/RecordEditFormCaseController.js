({
    handleSubmit: function(component, event, helper) {
        event.preventDefault();
        const fields = event.getParam('fields');
        fields.ContactId = component.get("v.recordId");
        component.find('recordEditForm').submit(fields);
    },
    
    handleSuccess : function(component,event,helper) {
        // Return to the contact page and
        // display the new case under the case related list
        var record = event.getParams();  
        console.log(record.id);
    
        var navService = component.find("navService");        
        var pageReference = {
            "type": 'standard__recordPage',         
            "attributes": {              
                "recordId": component.get("v.recordId"),
                "actionName": "view",               
                "objectApiName":"Contact"              
            }        
        };
                
        component.set("v.pageReference", pageReference);
            
        var pageReference = component.get("v.pageReference");
        navService.navigate(pageReference); 
    }
})