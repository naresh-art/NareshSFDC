trigger PrefixTrigger on Account (before insert) {
    for(Account a:trigger.new){
        a.name='company'+a.name+'Sofware';
    }
}