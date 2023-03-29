import { LightningElement, track, wire } from 'lwc';
import getPermissionSet from '@salesforce/apex/PermissionController.getPermissionSet';
// import getObjectPermissionsByPermissionSet from '@salesforce/apex/PermissionController.getObjectPermissionsByPermissionSet';
// import getFieldPermissionsByPermissionSet from '@salesforce/apex/PermissionController.getFieldPermissionsByPermissionSet';

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

export default class PermissionSetComponent extends LightningElement {

    permissionSets = [];
    selectedPermissionSetId = '';
    showErrors = false;
    isLoadingObjects = false;
    isLoadingFields = false;
    showPermissionData = false;
    showFieldPermissionTable = false;
    ojbectDataColumns = ojbectDataColumns;
    fieldDataColumns = fieldDataColumns;

    @track objectPermissionData = [];
    @track fieldPermissionData = [];

    @wire(getPermissionSet)
    obtainedPermissionSets({ data, error }) {
        if (error) {
            console.log(error);
        }
        else {
            const permissionSets = data;
            this.permissionSets = permissionSets;
        }
    };

    handlePermissionSetChange(event) {
        this.isLoadingObjects = true;
        this.selectedPermissionSetId = event.detail.value;
        this.showFieldPermissionTable = false;
        this.fieldPermissionData = [];
        this.objectPermissionData = [];
        // getObjectPermissionsByPermissionSet({ permissionSetId: this.selectedPermissionSetId })
        //     .then((result) => {
        //         console.log("The result is " + JSON.stringify(result));
        //         this.showPermissionData = true;
        //         this.showErrors = false;
        //         this.objectPermissionData = result;
        //     })
        //     .catch((error) => {
        //         this.showPermissionData = false;
        //         this.showErrors = true;
        //         console.log("Errors encountered in method " + error);
        //     })
        //     .finally(() =>{
        //         this.isLoadingObjects = false;
        //     });

    }

    objectSelected(event) {
        this.isLoadingFields = true;
        console.log("The slected data is " + JSON.stringify(event.detail), ' ', this.selectedPermissionSetId);
        this.showFieldPermissionTable = true;
        // getFieldPermissionsByPermissionSet({ permissionSetId: this.selectedPermissionSetId, objName: event.detail.apiName })
        //     .then((result) => {
        //         console.log("THe incoming result is " + JSON.stringify(result));
        //         this.showFieldPermissionTable = true;
        //         this.showErrors = false;
        //         this.fieldPermissionData = result;
        //     })
        //     .catch((error) => {
        //         this.showFieldPermissionTable = false;
        //         this.showErrors = true;
        //         console.log("Errors encountered " + error);
        //     })
        //     .finally(() =>{
        //         this.isLoadingFields = false;
        //     });
    }

}