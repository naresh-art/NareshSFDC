@RestResource(urlMapping='/AccountRecord/*')
global with sharing class AccountRestService {
@HttpGet
    global static void getAccountById(){
        string jsonString;
        string accountid = RestContext.request.params.get('accountId');
        Account actobj = [select id,name,type,industry from Account where id=:accountId];
        jsonString = JSON.serialize(actobj);
        RestContext.response.addHeader('Contenet-Type','application/json');
        RestContext.response.responseBody=Blob.valueOf(jsonString);        
    }
}