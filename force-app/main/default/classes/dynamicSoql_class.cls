public class dynamicSoql_class {
    Public List<Account> accs {set;get;}
    public String accName {set;get;}
    public string accIndustry {set;get;}
    public void search()
    {
        accs=[select name,industry from Account where name=:accName and industry=:accIndustry];
    }
    public void dynamicSearch()
    {
        string query = 'select name,industry from Account';
        if((accName!=NULL && accName!='')&&(accIndustry!=''&&accIndustry!=NULL)){
            query=query+'where name=\''+accName+'\'and industry=\''+accIndustry+'\'';
        }
        else {
            if(accName!=null && accName!=''){
                query = query +'where name=\''+accName+'\'';
            }
            else{
                if(accIndustry!=null && accIndustry!=''){
                    query = query +'where industry=\''+accIndustry+'\'';
                }
            }
        }
        accs = Database.query(query);
    }
}