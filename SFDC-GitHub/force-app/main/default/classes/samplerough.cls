public class samplerough {
    public void main(){
        
       List<Account> a = [select id,name,industry from Account Where name='ramarama'];
       delete a;  
        Account toUpdate = [select id,name,rating from Account Where name='Capital' and Rating='Hot'];
        toUpdate.Rating = 'warm';
        update toUpdate;
    }
}