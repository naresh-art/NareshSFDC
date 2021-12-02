public class dateFunctions {
    public list<Opportunity> opps {set;get;}
    public dateFunctions(){
        opps=[select name,amount,createdDate,CloseDate from Opportunity];
    }
    public void closedAfter2016(){
        opps=[select name,amount,createdDate,closeDate from Opportunity where closeDate > LAST_N_YEARS:2];
    }
    public void lastYear(){
        opps=[select name,amount,createdDate,closeDate from Opportunity where closeDate = LAST_YEAR];
    }
    public void thisWeek(){
        opps=[select name,amount,createdDate,closeDate from Opportunity where createdDate = THIS_WEEK];
    }
    public void lastMonth(){
        opps=[select name,amount,createdDate,closeDate from Opportunity where createdDate = LAST_MONTH];
    }
    public void validate(){
        opps=[select name,amount,createdDate,closeDate from Opportunity where amount < 25000];
    }

}