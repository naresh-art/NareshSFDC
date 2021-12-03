trigger accountIndustry on Account (before insert) 
{
    for(Account a :trigger.new)
    {
        if(a.Industry=='Energy')
            a.Description='Energy Account';
    }
}