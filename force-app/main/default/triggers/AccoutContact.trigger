trigger AccoutContact on Account(After Insert)
{

if(trigger.isAfter && trigger.isInsert){
AccountContactvamritech.createContact(trigger.New);
}

}