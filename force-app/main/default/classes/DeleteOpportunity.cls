global class DeleteOpportunity implements Database.Batchable<sobject> {

//global integer i=o;
           global Database.QueryLocator start(Database.BatchableContext bc)
           {
            return Database.getQueryLocator('select id from Opportunity');
           }

           global void execute(Database.BatchableContext bc, List<sobject> records)
           {
               delete records;
               //i+=records.size();
           }
           global void finish(Database.BatchableContext bc)
           {
               
           }
}