public class NewAccontCreationControllerTest {
    public Account act{set;get;}
    public NewAccontCreationControllerTest(){
        act = new Account();               //New Account creation            
    }
    public pageReference saveAccount(){
        insert act;
        return new pageReference('/'+act.Id);   // Return New page by Using Account id.
    }
}