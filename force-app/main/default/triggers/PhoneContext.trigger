trigger PhoneContext on Account (before insert,before Update) {
    for(Account a:trigger.new){
        if(trigger.isInsert && a.Phone==null){
            a.addError('Please enter Phone number ');
        }
        if(trigger.isUpdate && a.phone==null){
            a.addError('please update phone field value');
        }
        else{
            if(a.Rating=='Hot' && a.Ownership=='private'){                
            a.addError('please change Rating And OwnerShip Values');
            }
        }
    }
}