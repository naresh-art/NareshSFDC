public class email_Class {
    String subject {get; set;}
    String email_body {get; set;}
        List<String> emails = new List<String>{'nareshpunagani316@gmail.com'};

    public pageReference send()
    {
        Messaging.singleEmailmessage email = new Messaging.singleEmailmessage();
        
        email.setSubject(subject);
        email.setplaintextbody(email_body);
        email.setToAddresses(emails);
        
        Messaging.sendEmailResult[] r = Messaging.sendEmail(new Messaging.singleEmailmessage[] {email});
        
        return null;
    }
}