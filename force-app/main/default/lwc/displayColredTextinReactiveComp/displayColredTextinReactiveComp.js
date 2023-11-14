import { LightningElement, api } from 'lwc';

export default class DisplayColredTextinReactiveComp extends LightningElement {
    @api color='Blue';
    @api text='Hello world';

    get colourStyle(){
        return `color: ${this.color};`
    }
}