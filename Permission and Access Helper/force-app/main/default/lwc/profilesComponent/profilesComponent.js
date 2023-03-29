import { LightningElement, wire, track } from 'lwc';
import getProfile from '@salesforce/apex/PermissionController.getProfile';
// import getObjectPermissionsByProfile from '@salesforce/apex/PermissionController.getObjectPermissionsByProfile';
// import getFieldPermissionsByProfile from '@salesforce/apex/PermissionController.getFieldPermissionsByProfile';

const ojbectDataColumns = [
    { label: 'Object Label', fieldName: 'label' },
    { label: 'Object Api Name', fieldName: 'apiName' },
    { label: 'Read', fieldName: 'Read', type: 'boolean' },
    { label: 'Create', fieldName: 'Create', type: 'boolean' },
    { label: 'Edit', fieldName: 'Edit', type: 'boolean' },
    { label: 'Delete', fieldName: 'Delete', type: 'boolean' },
    { label: 'View All Records', fieldName: 'ViewAllRecords', type: 'boolean' },
    { label: 'Modify All Records', fieldName: 'ModifyAllRecords', type: 'boolean' },
];

const fieldDataColumns = [
    { label: 'Field Label', fieldName: 'label' },
    { label: 'Field Api Name', fieldName: 'apiName' },
    { label: 'Read', fieldName: 'Read', type: 'boolean' },
    { label: 'Edit', fieldName: 'Edit', type: 'boolean' },
];

export default class ProfilesComponent extends LightningElement {

    profiles=[];
    selectedProfileId = '';
    isLoadingObjects = false;
    isLoadingFields = false;
    showErrors = false;
    showPermissionData = false;
    showFieldPermissionTable = false;
    ojbectDataColumns = ojbectDataColumns;
    fieldDataColumns = fieldDataColumns;
    
    @track objectPermissionData = [];
    @track fieldPermissionData = [];
    
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
        this.isLoadingObjects = true;
        this.showPermissionData = true;
        this.selectedProfileId = event.detail.value;
        this.showFieldPermissionTable = false;
        this.fieldPermissionData = [];
        this.objectPermissionData = [];
        console.log("Selcted profile is " + JSON.stringify(this.selectedProfileId));
        // getObjectPermissionsByProfile({ profileId : this.selectedProfileId})
        //     .then((result) => {
        //         this.showPermissionData = true;
        //         this.showErrors = false;
        //         this.objectPermissionData = result;
        //     })
        //     .catch((error) => {
        //         this.showPermissionData = false;
        //         this.showErrors = true;
        //         console.log("Errors encountered " + error);
        //     })
        //     .finally(() => {
        //         this.isLoadingObjects = false;
        //     });
    }

    objectSelected(event){
        this.isLoadingFields = true;
        console.log("The slected data is " + JSON.stringify(event.detail));
        this.showFieldPermissionTable = true;
        // getFieldPermissionsByProfile({ profileId : this.selectedProfileId, objName : event.detail.apiName})
        //     .then((result) => {
        //         console.log("THe incoming result is " + JSON.stringify(result));
        //         this.showFieldPermissionTable = true;
        //         this.showErrors = false;
        //         this.fieldPermissionData = result;
        //     })
        //     .catch((error) => {
        //         this.showFieldPermissionTable = false;
        //         this.showErrors = true;
        //         console.log("Errors encountered " + JSON.stringify(error));
        //     })
        //     .finally(() => {
        //         this.isLoadingFields = false;
        //     });
    }


}