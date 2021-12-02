public class email2program_class 
{
    public pageReference sendEmail()
    {
        messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
        string[] toAddress= new string[]{'nareshpunagani316@gmail.com','ramanareddyv1992@gmail.com'};
        msg.setToAddresses(toAddress);    
        string[] toBccAddress=new string[]{'ramanareddyv1992@gmail.com'};
        msg.setBccAddresses(toBccAddress);
        string[] toCcAddress=new string[]{'nareshpunagani316@gmail.com'};
        msg.setCcAddresses(toCcAddress);
        msg.setSubject('Welcome to salesforce');
        msg.setPlainTextBody('you are selected to thr salesforce Developer');
        messaging.sendEmail(new messaging.SingleEmailMessage[]{msg});
        return null;
    }
}