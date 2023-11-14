({
	doSave : function(component, event, helper) {
		var action = component.get("c.createContact");
        var contactList = component.get("v.contactList");
        action.setParams({'contObj':component.get('v.contactObj')});
        action.setCallback(this,function(data){           
            component.set('v.contactId',data.getReturnValue())
            contactList.splice(0,0,component.get('v.contactObj'));
            component.set("v.contactList",contactList);
             component.set("v.showFirstScreen",true);
            component.set("v.showAccountSearch",false);
        });
        
        $A.enqueueAction(action);
	},
    
        showContacts : function(component, event, helper) {       
            var action = component.get("c.retriveContacts");
            action.setCallback(this,function(data){
                //alert(data.getState());
                component.set('v.contactList',data.getReturnValue());
            });   
         
            $A.enqueueAction(action);
    },
    showFirstScreen : function(component, event, helper) {
        component.set("v.showAccountSearch",false);
        component.set("v.showFirstScreen",true);
        component.set("v.showsecondScreen",false);
  },
    showSecondScreen : function(component, event, helper) {
        component.set("v.showAccountSearch",true);
        component.set("v.showFirstScreen",false);
        component.set("v.showsecondScreen",false);
  },
    
})