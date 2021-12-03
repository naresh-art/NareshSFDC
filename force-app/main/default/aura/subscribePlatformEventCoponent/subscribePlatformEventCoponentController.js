({
	subscribe : function(component, event, helper) {
		component.set('v.notifications',[]);
        const empApi = component.find('empApi');  //get the empapi component
        const channel = '/event/Account_creation_event__e';  //get the channel from input box
        const replayId = -1; //replay option to get new events
        //subscribe an platform events
        empApi.subscribe(channel,replayId,$A.getCallback(evntRecived =>{
            //process event(this is called each time we recive an event)
            console.log('Recived event', JSON.stringify(evntRecived));
            console.log('Recived event', evntRecived.data.payload.Account_name__c);
            const notifications = component.get('v.notifications');
            notifications.push(evntRecived.data.payload.Account_Name__c);
            component.set('v.notifications',notifications);
            component.set('v.evntRecived',true);
        }))  .then(subscription => {
              //confirm that we have subscried to the event channel.
              //we haven't recived an event yet.
              console.log('subscribe to channel',subscription.channel);
              //save subscription to unsubscribe later
             // component.set('v.subscription',subscription);
        });
	}
})