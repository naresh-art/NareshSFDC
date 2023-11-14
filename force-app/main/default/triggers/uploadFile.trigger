trigger uploadFile on efaxapp__Sent_Fax__c (after insert) {
    for(efaxapp__Sent_Fax__c faxObj:trigger.new){
        //Read file content
        StaticResource sr=[select body from StaticResource where Name='SentFaxFile' LIMIT 1];
        system.debug('log000 '+ sr);
        string content=EncodingUtil.base64Encode(sr.body);
        system.debug('log001  '+content);
        
        Attachment attObj = new Attachment();
        attObj.Body  = EncodingUtil.base64Decode(EncodingUtil.base64Encode(sr.body));
        attobj.ContentType='application/pdf';
        attObj.ParentId = faxObj.Id;
        attObj.Name = 'operofax.pdf' ;
        system.debug('log00 '+attObj);
        insert attObj;
        system.debug('log00');
    }
    
}