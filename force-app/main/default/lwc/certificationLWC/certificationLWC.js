/*import { LightningElement, api, wire } from 'lwc';
import getRelatedFilesByRecordId from '@salesforce/apex/certificationsClass.getRelatedFilesByRecordId'
import {NavigationMixin} from 'lightning/navigation'
export default class CertificationLWC extends NavigationMixin(LightningElement) {

    @api recordId;
    filesList =[]
    @wire(getRelatedFilesByRecordId, {recordId: '$recordId'})  
    wiredResult({data, error}){ 
        if(data){ 
            console.log(data)
            this.filesList = Object.keys(data).map(item=>({"label":data[item],
             "value": item,
             "url":`/sfc/servlet.shepherd/document/download/${item}`
            }))
            console.log(this.filesList);
            console.log('++++this.filesList'+JSON.stringify(this.filesList));
        }
        if(error){ 
            console.log(error);
        }
    }
    previewHandler(event){
        console.log(event.target.dataset.id)
        this[NavigationMixin.Navigate]({ 
            type:'standard__namedPage',
            attributes:{ 
                pageName:'filePreview'
            },
            state:{ 
                selectedRecordId: event.target.dataset.id
            }
        })
    }
}*/

import { api, LightningElement, track } from "lwc";
import getAccounts from "@salesforce/apex/certificationsClass.getAccounts";
import { NavigationMixin } from "lightning/navigation";
export default class CertificationLWC extends NavigationMixin(
  LightningElement
) {
  @api recordId='0037F00002MOUzfQAH';
  @track FileRecords = [];
  showMessage = "";
  connectedCallback() {
    getAccounts({recordId : this.recordId})
      .then((response) => {
        if (response !== null) {
          this.FileRecords = response;
          let baseUrl = this.getBaseUrl();
          this.FileRecords.forEach((file) => {
            file.downloadUrl =
              baseUrl + "sfc/servlet.shepherd/document/download/" + file.Id;
          });
        }
      })
      .catch((error) => {
        console.log("Error: " + error.body.message);
      });
  }
  handleDownload(event) {
    this.FileRecords.forEach((eachFile) => {
      if (eachFile.Id === event.target.value) {
        this[NavigationMixin.Navigate](
          {
            type: "standard__webPage",
            attributes: {
              url: eachFile.downloadUrl
            }
          },
          false
        );
      }
    });
  }
  getBaseUrl() {
    let baseUrl = "https://" + location.host + "/";
    return baseUrl;
  }
}