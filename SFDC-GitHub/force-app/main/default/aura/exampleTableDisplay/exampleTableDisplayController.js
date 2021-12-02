({
    doInit : function(component, event, helper) {        
        helper.getColumnAndAction(component);
        helper.getAccounts(component, helper);
    },
     
    handleNext : function(component, event, helper) { 
        var pageNumber = component.get("v.pageNumber");
        component.set("v.pageNumber", pageNumber+1);
        helper.getAccounts(component, helper);
    },
     
    handlePrev : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumber");
        component.set("v.pageNumber", pageNumber-1);
        helper.getAccounts(component, helper);
    },
    handleCancel : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumber");
        component.set("v.pageNumber", pageNumber);
        helper.doCancel(component, helper);
    },
    handleAdd : function(component, event, helper) {        
        var pageNumber = component.get("v.pageNumber");
        component.set("v.pageNumber", pageNumber);
        helper.createRecord(component, helper);
    },
 
    handleRowAction: function (component, event, helper) {
        var action = event.getParam('action');
        switch (action.name) {
            case 'edit':
                helper.editRecord(component, event);
                break;
            case 'delete':
                helper.deleteRecord(component, event);
                break;
            case 'view':
                helper.viewRecord(component, event);
                break;
        }
    },
     
    searchKeyChange: function(component, event) {
        var searchKey = component.find("searchKey").get("v.value");
        console.log('searchKey:::::'+searchKey);
        var action = component.get("c.findByName");
        action.setParams({
            "searchKey": searchKey
        });
        action.setCallback(this, function(a) {
            component.set("v.data", a.getReturnValue());
        });
       
         $A.enqueueAction(action);
    },
    
    updateSelectedText: function (component, event, helper) {
        var selectedRows = event.getParam('selectedRows');
        component.set('v.selectedRowsCount', selectedRows.length);
        for (var i = 0; i < selectedRows.length; i++){
          
            alert("You selected: " + selectedRows[i].Name);
            
     
              }           
    },
    
   
    
})