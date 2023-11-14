({
    init: function (component, event, helper) {
        helper.fetchStageList(component);
    },
    
    handleMarkAsCurrentClick: function (component, event, helper) {
        var isCurrentButtonClicked=!component.get("v.showCompleteButton");
        
        if(isCurrentButtonClicked){
            var currIndex=component.get("v.selectedIndex");
            helper.validateAndUpdateStatus(component,currIndex,false);
            return;
        }
        
        helper.checkAndUpdateCurrentStage(component);
        component.set("v.IsWorkflowComplete", false);
    },
    
    handleStepClickEvent: function (component, event, helper) {
        let selectedIndex = component.get("v.selectedIndex");
        helper.validateAndUpdateStatus(component,selectedIndex,true);
    },
    
    handleStepClick: function (component, event, helper) {
        
        let currentStage = component.get('v.currentStage'),
            selectedIndex = event.getParam("index"),
            showCompleteButton = false,
            stages = component.get("v.steps");         
        component.set("v.selectedIndex", selectedIndex);
        console.log('Hello'+selectedIndex);
        showCompleteButton = currentStage.split("-")[1] != selectedIndex ? false : true;
        
        component.set('v.disablePathButton',false);
        
        if (component.get('v.isPathComplete') && parseInt(selectedIndex) + 1 == stages.length) {
            component.set('v.disablePathButton',true);
            component.set("v.selectedIndex", selectedIndex);
        }
        component.set("v.showCompleteButton", showCompleteButton);
    }
});