/**
* @Description        : This trigger is used to handle Exception.
* @HandlerClass       : REMSLoggerUtility
* @Author 			  : VamriTech Private Limited
* @Modification Log   :
* Ver       Date            Developer      		        Modification
* 1.0    02-11-2022        	Naresh P           		Initial Implementation.
**/
trigger REMSCustomErrorEventTrigger on Custom_Error__e (After insert) {
    REMSLoggerUtility.insertLog(Trigger.new);
}