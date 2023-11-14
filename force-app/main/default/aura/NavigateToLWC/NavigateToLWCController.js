({
    /*init: function(cmp, evt, helper) {
        var myPageRef = cmp.get("v.pageReference");
        var propertyValue = myPageRef.state.c__propertyValue;
        cmp.set("v.propertyValue", propertyValue);
    }*/

    navigateToMyComponent : function(component, event, helper) {
        var evt = $A.get("e.force:navigateToComponent");
        evt.setParams({
            componentDef : "c:targetLwcComponent",
            componentAttributes: {
                contactId : component.get("v.recordId")
            }
        });
        evt.fire();
    }
})