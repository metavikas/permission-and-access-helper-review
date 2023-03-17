import { LightningElement, wire, track } from 'lwc';
import getProfile from '@salesforce/apex/PermissionController.getProfile';
import getObjectPermissionsByProfile from '@salesforce/apex/PermissionController.getObjectPermissionsByProfile';

export default class ProfilesComponent extends LightningElement {

    profiles=[];
    selectedProfileId = '';
    showObjectPermissionTable = false;
    @track objectPermissionData = [];
    
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
                this.showObjectPermissionTable = true;
                this.showErrors = false;
                this.objectPermissionData = result;
            })
            .catch((error) => {
                this.showObjectPermissionTable = false;
                this.showErrors = true;
                console.log("Errors encountered " + error);
            });
    }


}