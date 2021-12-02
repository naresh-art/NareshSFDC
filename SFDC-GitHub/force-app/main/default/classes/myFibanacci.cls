public class myFibanacci
{
   public integer i,n=5,t1=0,t2=1,z;
    public void myFib()
    {
        for(i=1;i<=n;i++)
        {
            z = t1+t2;
            t1 = t2;
            t2 = z;
            System.debug('the fibnnaciss series of z is:'+z);
        }
    }  
}