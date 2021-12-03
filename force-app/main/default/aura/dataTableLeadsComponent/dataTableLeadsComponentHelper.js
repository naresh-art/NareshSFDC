({
    getColumnAndAction : function(component) {
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'AnnualRevenue', fieldName: 'AnnualRevenue', type: 'text'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'Email'},
            {label: 'Phone', fieldName: 'Phone', type: 'phone'}
        ]);
    },
     
    getAccounts : function(component, helper) {
        var action = component.get("c.getAccounts");
        var pageSize = component.get("v.pageSize").toString();
        var pageNumber = component.get("v.pageNumber").toString();
        var searchText = component.get("v.searchText");
         
        action.setParams({
            'pageSize' : pageSize,
            'pageNumber' : pageNumber,
            'firstName' : searchText
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var resultData = response.getReturnValue();
                if(resultData.length < component.get("v.pageSize")){
                    component.set("v.isLastPage", true);
                } else{
                    component.set("v.isLastPage", false);
                }
                component.set("v.dataSize", resultData.length);
                component.set("v.data", resultData);
            }
        });
        $A.enqueueAction(action);
    },
     
    
})