trigger OppAmount on Opportunity (before insert) {
    for(Opportunity O:trigger.new){
        if(trigger.isInsert && O.Amount<10000 && O.StageName=='Qualification')
            O.addError('please change amount and StagenName Values');
    }
}