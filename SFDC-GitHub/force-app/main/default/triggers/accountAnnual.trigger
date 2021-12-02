trigger accountAnnual on Account (before insert) {
 
    for(Account a :trigger.new)
{
    if(a.Industry=='Banking')
        a.AnnualRevenue=5000000;
}
}