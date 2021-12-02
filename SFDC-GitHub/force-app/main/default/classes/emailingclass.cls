public class emailingclass {
    public String subject {get; set;}
    public String email_body {get; set;}
    List<String> emails = new List<String>{'ramanareddyv1992@gmail.com','nareshpunagani316@gmail.com','csivaprasad55@gmail.com'};
        public pageReference send(){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject(subject);
            email.setPlainTextBody(email_body);
            email.setToAddresses(emails);
            Messaging.SendEmailResult[] r = Messaging.sendEmail(new Messaging.singleEmailmessage[] {email});
            return page.endpage;
        }
}