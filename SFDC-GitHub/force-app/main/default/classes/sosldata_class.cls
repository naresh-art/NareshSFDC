public class sosldata_class {
    string keyword;
    list<Account> results;
     list<Opportunity> results1;
    list<Contact> results2;
    
    public string getkeyword(){
        return keyword;
    }
    public list<Account> getresults(){
        return results;
    }
    public list<Opportunity> getresults1(){
        return results1;
    }
    public list<Contact> getresults2(){
        return results2;
    }
    public void setkeyword(string input)
    {
       keyword=input;
    }
    public pageReference search_now(){
        
        results=(list<Account>)[FIND:keyword IN ALL FIELDS RETURNING Account(name,industry,phone)][0];
        return null;
    }
    public pageReference search_now1(){
        
        results1=(list<Opportunity>)[FIND:keyword IN ALL FIELDS RETURNING Opportunity(name,stageName,amount)][0];
        return null;
    }
    public pageReference search_now2(){
        results2=(list<Contact>)[FIND:keyword IN ALL FIELDS RETURNING Contact(lastname,firstName)][0];
        return null;
    }
}