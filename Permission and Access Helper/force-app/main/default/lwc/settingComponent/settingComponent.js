import { LightningElement, wire } from 'lwc';
import getProfile from '@salesforce/apex/PermissionController.getProfile';
export default class SettingComponent extends LightningElement {

    profiles=[]
    @wire(getProfile) 
    obtainedProfiles({data,error}){
        if(error){
            console.log(error);
        }
        else{
            // console.log(data);
           const profiles=data;
           this.profiles=profiles;
        }
    };


}