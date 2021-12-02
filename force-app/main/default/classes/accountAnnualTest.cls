@isTest
public class accountAnnualTest {
    public static testmethod void annualtest(){
        integer count=[select count() from Account];
        Account a1 = new Account(name='mouni',industry='Banking');
        Account a2 = new Account(name='raji',Industry='Energy');
        try{
            insert a1;
            insert a2;
        }
        catch(Exception e){
            System.debug(e);
        }
        integer size=[select count() from Account];
        System.assertEquals(size, count+2);
        Account acc=[select AnnualRevenue from Account Where id=:a1.id];
        System.assertEquals(acc.AnnualRevenue, 500000);
        Account acc2=[select AnnualRevenue From Account Where id=:a2.id];
        System.assertEquals(acc2.AnnualRevenue, a1.AnnualRevenue);
    }
}