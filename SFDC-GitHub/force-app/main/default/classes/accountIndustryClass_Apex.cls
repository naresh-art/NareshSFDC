@isTest
public class accountIndustryClass_Apex {
    public Static testmethod void myaccIndusTrig(){
        list<Account> accs = new list<Account>();
        for(Integer i=0;i<200;i++){
            Account a = new Account(name='test'+i,industry='Energy');
            accs.add(a);
        }insert accs;
        list<Account> insert_accs=[select name,Description from Account where ID in:accs];
        for(Account a1:insert_accs){
            System.assertEquals(a1.Description, 'Energy Account');
        }
    }
}