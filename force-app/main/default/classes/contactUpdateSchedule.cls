global class contactUpdateSchedule implements Schedulable{
global void execute(SchedulableContext SC) {
//Non static method cannot be referenced from a static context
        contactUpdate abc = new contactUpdate();
        abc.resetRouteDelays();
    }
}