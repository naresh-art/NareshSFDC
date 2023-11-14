/**
* @Description        : This is an Utility class to handle Exception.
* @TestClass          : REMSLoggerUtilityTest
* @Author 			  : VamriTech Private Limited
* @Modification Log   :
* Ver       Date            Developer      		        Modification
* 1.0    02-11-2022        	Naresh P           		Initial Implementation.
**/
public with sharing class REMSLoggerUtility {

    private static List<Custom_Error__e> errorEventList = new List<Custom_Error__e>();

    public enum customLogLevel {NONE, INTERNAL, ERROR, DEBUG, INFO} 
    
    private static String[] dbLogLevel = new String[]{ 'INTERNAL', 'ERROR', 'DEBUG', 'INFO'};

    public static void customLogs(Exception exe, String logMsg) {
        customLogs(exe, logMsg, '', '');
    }

    public static void customLogs(Exception exe, String logMsg, String jobId, String batchId) {
       /* //new code
        String OrgNamespace = [SELECT NamespacePrefix FROM Organization].NamespacePrefix;
        String stackTrace;
        if(OrgNamespace!=null)
        {  
            System.debug('Namespace Org::'+OrgNamespace);
            stackTrace= exe.getStackTraceString();   
        } else {
            System.debug('No Namespace Org::'+OrgNamespace);
            stackTrace= exe.getStackTraceString();
        }*/

        String message = logMsg != null ? logMsg : '';
        message = message + '\n' + 'Message: ' + exe.getMessage() + '\n' + 'Cause: ' + exe.getCause() + '\n' + 'Stack: ' + exe.getStackTraceString();
        message = message + '\n' + 'Line number: ' + exe.getLineNumber() + '\n' + 'Type name: ' + exe.getTypeName() + '\n';
        //customLlogException(customLogLevel.ERROR, message, jobId, batchId);
        System.debug(logginglevel.error,'LogOC logException: level ' + customLogLevel.ERROR);
        System.debug(logginglevel.error,'LogOC logException: message ' + message);
        System.debug(logginglevel.error,'LogOC logException: jobId ' + jobId);
        System.debug(logginglevel.error,'LogOC logException: batchId ' + batchId);
        customLogs(customLogLevel.ERROR, message, jobId, batchId, 'Exception');
    }


    public static void customLogs(customLogLevel level, String message, String jobId, String batchId, String errorType) {
        if (level != NULL && level != customLogLevel.NONE) {
            Custom_Error__e errorEvent = new Custom_Error__e(); 
            errorEvent.Exception_Type__c = dbLogLevel[level.ordinal() - 1];
            errorEvent.Exception_Message__c = message;     
            errorEvent.StackTrace__c = errorType;
            errorEventList.add(errorEvent);
        }
        publishException();
    }

    
    //publish events
    public static void publishException(){
        Database.SaveResult[] listSaveResult;
        if(errorEventList.size()>0){
            listSaveResult = EventBus.publish(errorEventList);
        }
        for(Database.SaveResult result : listSaveResult){
            // Check result of publish for error
            if (result.isSuccess()) {
                System.debug('Successfully published error event');
            } else {
                System.debug('Failed to publish error event:');
                for (Database.Error error : result.getErrors()) {
                    System.debug(error.getStatusCode() + ' - ' + error.getMessage());
                }
            }
        }
        errorEventList.clear();
    }

    public static void insertLog(List<Custom_Error__e> eventList) {
        List<Custom_Error_Log__c> customErrorLogsList = new List<Custom_Error_Log__c> ();
        for (Custom_Error__e event: eventList) {
            Custom_Error_Log__c customErrorLogObj = new Custom_Error_Log__c(); 
            customErrorLogObj.Exception_Type__c = event.Exception_Type__c;
            customErrorLogObj.Exception_Message__c = event.Exception_Message__c;     
            customErrorLogObj.StackTrace__c = event.StackTrace__c;
            customErrorLogsList.add(customErrorLogObj);
        }
        if (customErrorLogsList.size() > 0) {
            Database.DMLOptions dmlOptions = new Database.DMLOptions();
            dmlOptions.allowFieldTruncation = true;
            dmlOptions.optAllOrNone = true;
            Database.insert(customErrorLogsList, dmlOptions);

        }
    }
}