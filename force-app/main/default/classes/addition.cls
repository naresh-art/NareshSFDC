Public class addition 
{
     public integer a=10,b=15,c,d,e,i,n=5,f=1,t1=0,t2=1,z,x=8,j;
   Public void myAdd()
   {
       c = a+b;
       System.debug('the value of c is:'+c);
       System.debug('the value of a is:'+a);
       System.debug('the value of b is:'+b);
   }
    Public void mySub()
   {
       d = a-b;
       System.debug('the value of d is:'+d);
       System.debug('the value of a is:'+a);
       System.debug('the value of b is:'+b);
   }
    public void myMul()
    {
        e = a*b;
        System.debug('the value of e is:'+e);
        System.debug('the value of a is:'+a);
        System.debug('the value of b is:'+b);
    }
    public void myFact()
    {
        for(i=1;i<=n;i++)
        {
            f = f*i;
            System.debug('the factorial of f is:'+f);
        }   
    }
    public void myFib()
    {
        for(j=1;j<=x;j++)
        {
            z = t1+t2;
            t1 = t2;
            t2 = z;
            System.debug('the fibnnaciss series of z is:'+z);
        }
    }
    
}