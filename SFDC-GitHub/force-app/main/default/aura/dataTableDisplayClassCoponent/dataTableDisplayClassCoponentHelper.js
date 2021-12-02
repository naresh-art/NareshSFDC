({
    getColumnAndAction : function(component) {
        var iconName =  component.get("v.addIcon");
        component.set('v.columns', [
            {type: 'button-icon', typeAttributes: {name: 'add', iconName: {fieldName: 'iconName'}, disabled: {fieldName: 'disabledValue'}, alternativeText: 'Add the Pet to the Case'}},
            {label: 'Name', fieldName: 'Name', type: 'text'}, 
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
    changeActionIcons : function (component, row) {
    var data = component.get('v.data');
                 var selRows =[];
      selRows = component.get("v.lstSelectedRecords");
    data = data.map(function(rowData) {
        if (rowData.Id == row.Id && rowData.iconName == 'utility:add') {
            rowData.iconName = 'utility:check';
            rowData.disabledValue = true;
      		 selRows.push(row);
   }
 else {
            rowData.iconName = 'utility:add';
            rowData.disabledValue = false;
        }
        return rowData;
    });
    component.set("v.data", data);
    component.set("v.lstSelectedRecords",selRows);
}
     
    
    
})