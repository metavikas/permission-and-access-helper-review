import { LightningElement } from 'lwc';
import { sample } from './reducedData';

export default class TableToRenderData extends LightningElement {
    data = sample;
}