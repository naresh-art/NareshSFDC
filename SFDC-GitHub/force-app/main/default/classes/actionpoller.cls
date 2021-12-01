public class actionpoller {
integer count=0;
    public pageReference incrementcounter(){
        count++;
        return null;
    }
    public integer getCount(){
        return count;
    }
}