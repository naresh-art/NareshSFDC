public class createCampingItemCalss {
@auraenabled
    public static Camping_Item__c createCampingItemSave (Camping_Item__c campitem){
      //  System.debug('Camping_Item__c',+campitem.Name);
        insert campitem;
        return campitem;
        
    }
@auraenabled
    public static list<Camping_Item__c> retriveCampingItem(){
        return [select id, name,price__c,quantity__c from Camping_Item__c limit 5];
    }    
}