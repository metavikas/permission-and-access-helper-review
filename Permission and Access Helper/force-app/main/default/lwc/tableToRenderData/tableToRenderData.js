import { LightningElement } from 'lwc';
import { sample } from './reducedData';
import getAllPermissionData from '@salesforce/apex/PermissionController.getAllPermissionData';

export default class TableToRenderData extends LightningElement {
    data = [];
    async connectedCallback(){
        try{
            this.data = await getAllPermissionData();
            console.log(this.data);  
        }catch(e){
            console.log("Error are " + e);
        }
    }
}