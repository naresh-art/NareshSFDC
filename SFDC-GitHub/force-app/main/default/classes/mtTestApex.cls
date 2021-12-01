@isTest
public class mtTestApex {
    public static testmethod void mymethod(){
        addion ab = new addion();
        ab.a=30;
        ab.b=40;
        ab.myAddition();
        System.assertEquals(70,ab.c);
    }
}