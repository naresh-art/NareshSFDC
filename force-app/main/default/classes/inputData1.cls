public class inputData1 {
    public string empname {set;get;}
    public string empno {set;get;}
    public string empphone {set;get;}
    public string empaddr {set;get;}
    public string empemail {set;get;}
    public string empsal {set;get;}
    public string selected {set;get;}
    public string result {set;get;}
    public void submit(){
        
        result='succesfully submited data.'+selected;
    }
    public void reset(){
        
         empname=null;
         empno=null;
         empphone=null;
         empemail=null;
         empaddr=null;
         empsal=null;
    }
}