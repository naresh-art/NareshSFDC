({
   showModel: function(component, event, helper) {
      component.set("v.showModal", true);
   },
  
   hideModel: function(component, event, helper) {
      component.set("v.showModal", false);
   },
  
   saveDetails: function(component, event, helper) {
      component.set("v.showModal", false);
   },
     handleF1Comp:function (component, event, helper) {
    var evnt = $A.get("e.force:navigateToComponent");		
        evnt.setParams({
            componentDef  : "c:dataTableLeadsComponent",
            componentAttributes: { }
    });
        evnt.fire();
    }
})