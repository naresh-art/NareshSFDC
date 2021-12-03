/*import { LightningElement,wire } from 'lwc';
import findContactByAccountId from '@salesforce/apex/AccordionControllerClass.findContactByAccountId';

export default class AccordianFormatDisplayContacts extends LightningElement {
    activeSectionMessage = '';

    @wire(findContactByAccountId) contacts;


    handleToggleSection(event) {
        this.activeSectionMessage =
            'Open section name:  ' + event.detail.openSections;
    }

    handleSetActiveSectionC() {
        const accordion = this.template.querySelector('.example-accordion');

        accordion.activeSectionName = 'C';
    }
}*/

import { LightningElement,wire,api } from 'lwc';
import fetchAcc from '@salesforce/apex/AccordionControllerClass.fetchAcc';
export default class AccordianFormatDisplayContacts extends LightningElement {
    data1 = [];
    wiredActivities;
    records = '';
    error;
    @api recordId;
    @wire(fetchAcc,{
        RecId:'$recordId'
    })
    wiredclass({
        data, error
        
    }){
    if(data){
        let dataEditing = JSON.parse(JSON.stringify(data));
        console.log(JSON.stringify(dataEditing));
        this.records = dataEditing.length;
        this.data1 = dataEditing;
        
    }else if(error){
        this.error = error;
    }
    
}
}