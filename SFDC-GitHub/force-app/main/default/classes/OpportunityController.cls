Public with sharing class OpportunityController {  
  
    @AuraEnabled(cacheable=true)
    public static List<Contact> getOpps( String searchKey, String sortBy, String sortDirection) {
       
        String query = 'SELECT Name,AccountId,Email,Account.Name FROM Contact';
        system.debug('query---'+query);
        if ( searchKey != null && searchKey != '' ) {
            String key = '%' + searchKey + '%';
            query += ' WHERE Name LIKE :key';
        }
        if ( sortBy != null && sortDirection != null ) {
            query += ' ORDER BY ' + sortBy + ' ' + sortDirection;
        }
        return Database.query( query );
    }
              
 }