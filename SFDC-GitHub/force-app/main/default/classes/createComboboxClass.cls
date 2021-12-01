public class createComboboxClass {

    @auraenabled
    public static map<string,string> retriveValues(){
        
        map<string,string> dummyvaluesmap = new map<string,string>();
        
        for(Camping_Item__c campitem:[select id,name,price__c,quantity__c from Camping_Item__c limit 5]){
            dummyvaluesmap.put(campitem.id, campitem.name);
        }
     return dummyvaluesmap;      
    }
    
}