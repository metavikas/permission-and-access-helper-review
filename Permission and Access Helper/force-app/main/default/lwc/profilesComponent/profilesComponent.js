import { LightningElement, wire, track } from 'lwc';
import getProfile from '@salesforce/apex/PermissionController.getProfile';
import getObjectPermissionsByProfile from '@salesforce/apex/PermissionController.getObjectPermissionsByProfile';

export default class ProfilesComponent extends LightningElement {

    profiles=[];
    selectedProfileId = '';
    showObjectPermissionTable = false;
    @track objectPermissionData = [];
    @track errors;
    
    @wire(getProfile) 
    obtainedProfiles({data,error}){
        if(error){
            console.log(error);
        }
        else{
           const profiles=data;
           this.profiles=profiles;
        }
    };

    handleProfileChange(event){
        this.showObjectPermissionTable = true;
        this.selectedProfileId = event.detail.value;
        console.log("Selcted profile is " + JSON.stringify(this.selectedProfileId));
        getObjectPermissionsByProfile({ profileId : this.selectedProfileId})
            .then((result) => {
                this.objectPermissionData = result;
                this.objectPermissionData = [...this.objectPermissionData]
                console.log("Data in var is " + JSON.stringify(this.objectPermissionData.slice(0, 5)));
            })
            .catch((error) => {
                console.log("Errors encountered")
                this.errors = error;
            });
    }


}