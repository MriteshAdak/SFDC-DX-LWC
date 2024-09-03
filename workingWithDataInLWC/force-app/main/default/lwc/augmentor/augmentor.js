import { LightningElement } from 'lwc';

export default class Augmentor extends LightningElement {

    startCounter = 10;
    handleStartChange(event) {
      this.startCounter = parseInt(event.target.value);
    }
    handleMaximizeCounter(event) {
        this.template.querySelector('c-numerator').maximizeCounter(this.startCounter);
      }
}