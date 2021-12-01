({
    handleClick : function(component, event, helper) {        
        helper.getColumnAndAction(component);
        helper.getAccounts(component, helper);
    },
    doInit : function(component, event, helper) { 
        console.log('++indoinit');
         helper.getColumnAndAction(component);
         var action = component.get("c.getRecentContacts");
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('++indoinit'+response.getReturnValue());
               component.set("v.data", response.getReturnValue());
                component.set("v.isLastPage", true);
                component.set("v.dataSize", 10);
            }
        });
        $A.enqueueAction(action);
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
 
    handleRowAction: function (component, event, helper) {
        //var action = event.getParam('action');
        var row = event.getParam('selectedRows');
        component.set("v.lstSelectedRecords" , null);
        component.set("v.lstSelectedRecords" , row);
        var forclose = component.find("lookup-pill");
        $A.util.addClass(forclose, 'slds-show');
        $A.util.removeClass(forclose, 'slds-hide');
         console.log('+++rowFinal'+JSON.stringify(component.get("v.lstSelectedRecords")));
       
    },
        clear :function(component,event,heplper){
        var selectedPillId = event.getSource().get("v.name");
        var AllPillsList = component.get("v.lstSelectedRecords"); 
        
        for(var i = 0; i < AllPillsList.length; i++){
            if(AllPillsList[i].Id == selectedPillId){
                AllPillsList.splice(i, 1);
                component.set("v.lstSelectedRecords", AllPillsList);
            }  
        }
            var ltngCmp = component.find("accDT");
    if(ltngCmp){
        ltngCmp.set("v.selectedRows", AllPillsList);            
    }  },
        
    createCampaignContacts :function(component,event,heplper){
        console.log('+++beforeaction')
        var action = component.get("c.createCampaignMembers");
         
        action.setParams({
            'campaignId' : component.get('v.recordId'),
            'leadList' : component.get("v.lstSelectedRecords")
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
            }
        });
        $A.enqueueAction(action);
    }
        	
 
        
        

})