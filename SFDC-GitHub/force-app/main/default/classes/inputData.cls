public class inputData {
    public integer Aval {set;get;}
    public integer Bval {set;get;}
    public integer Cval {set;get;}
    public void submit()
    {
        Cval=Aval+Bval;
    }
    public void rest(){
        Aval=null;
        Bval=null;
        Cval=null;
    }
}