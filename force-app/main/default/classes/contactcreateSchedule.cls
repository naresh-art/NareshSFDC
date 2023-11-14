global class contactcreateSchedule implements Schedulable{
global void execute(SchedulableContext SC) {
//Non static method cannot be referenced from a static context
        contactcreate abc = new contactcreate();
        abc.createcontactMethod();
    }
}