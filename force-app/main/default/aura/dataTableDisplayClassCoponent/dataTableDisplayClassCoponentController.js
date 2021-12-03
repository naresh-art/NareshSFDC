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
                var data = component.get('v.data');
   				 data = data.map(function(rowData) {
            		rowData.iconName = 'utility:add';
           			 rowData.disabledValue = false;
       				
        return rowData;
    });
            component.set("v.data", data);
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
 
   handleRowAction : function(component, event, helper) {
    var row = event.getParam('row');
        
       helper.changeActionIcons(component,row);
       console.log('++++rows'+JSON.stringify(component.get("v.lstSelectedRecords")));
        var forclose = component.find("lookup-pill");
        $A.util.addClass(forclose, 'slds-show');
        $A.util.removeClass(forclose, 'slds-hide');
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
        var allRow = component.get("v.data");
         for(var i = 0; i < allRow.length; i++){
            if(allRow[i].Id == selectedPillId){
                allRow[i].iconName = 'utility:add';
                allRow[i].disabled = false;
                component.set("v.data", allRow);
            }  
        }   
},
        
    createCampaignContacts :function(component,event,heplper){
        console.log('+++beforeaction')
        var action = component.get("c.createCampaignMembers");
         
        action.setParams({
            'campaignId' : component.get('v.recordId'),
            'contactList' : component.get("v.lstSelectedRecords")
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var dismissActionPanel = $A.get("e.force:closeQuickAction");
                dismissActionPanel.fire();
                var resultsToast = $A.get("e.force:showToast");
                resultsToast.setParams({
                    "title": "Saved",
                    "message": "The record was saved."
                });
                resultsToast.fire();
                $A.get('e.force:refreshView').fire();
                
                
               
            }
        });
        $A.enqueueAction(action);
    }
        	
              
    
    

})