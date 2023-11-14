import { LightningElement } from 'lwc';
import LightningAlert from "lightning/alert";
import LightningPrompt from "lightning/prompt";
import LightningConfirm from "lightning/confirm";
export default class DifferentNotificationComp extends LightningElement {
    handleAlert() {
       LightningAlert.open({
          message: "This is Alert Message",
          theme: "error",
          label: "Alert Header"
        }).then(() => {
          console.log("Alert is Closed");
        });
      }
     handleConfirm() {
        LightningConfirm.open({
          message: "This is Confirm Message",
          theme: "success",
          label: "Confirm Header"
        }).then(() => {
        console.log("Confirm result:", result);
      });
      }
      handlePrompt() {
        LightningPrompt.open({
          message: "This is Prompt Message",
          theme: "error",
          label: "Please Respond",
          defaultValue: "Test"
        }).then((result) => {
          console.log("Prompt result", result);
        });
      }
}