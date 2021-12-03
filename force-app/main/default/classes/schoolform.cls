public class schoolform {
    public string empname {set;get;}
    public integer empage {set;get;}
    public Long empphone {set;get;}
    public string empaddr {set;get;}
    public string empemail {set;get;}
    public integer empsal {set;get;}
     
    public void submit(){
        if(empname!=null && empname!='' && empage>0 && empphone>10 && empemail!=null && empemail!='' && empaddr!=null && empaddr!='' &&empsal>10000){
            ApexPages.Message msg=new ApexPages.Message(ApexPages.Severity.CONFIRM,'Data submited');
            ApexPages.addMessage(msg);
        }else {
            if(empname==null || empname==''){
            ApexPages.Message msg1=new ApexPages.Message(ApexPages.Severity.Error,'Enter empName');
            ApexPages.addMessage(msg1);
           }
            if(empage>100){
                ApexPages.Message msg2=new ApexPages.Message(ApexPages.Severity.Error,'Enter empage');
                ApexPages.addMessage(msg2);
            }   
             if(empphone>10){
                ApexPages.Message msg3=new ApexPages.Message(ApexPages.Severity.Error,'Enter empphone');
                ApexPages.addMessage(msg3);
            }   
              if(empemail==null || empemail==''){
                ApexPages.Message msg4=new ApexPages.Message(ApexPages.Severity.Error,'Enter empemail');
                ApexPages.addMessage(msg4);
            }   
            if(empaddr==null || empaddr==''){
                ApexPages.Message msg5=new ApexPages.Message(ApexPages.Severity.Error,'Enter empaddr');
                ApexPages.addMessage(msg5);
            }   
             if(empsal<10000){
                ApexPages.Message msg6=new ApexPages.Message(ApexPages.Severity.Error,'Enter empsal');
                ApexPages.addMessage(msg6);
            } 
        }
    }   
}