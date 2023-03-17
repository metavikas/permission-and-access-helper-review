import { LightningElement, track, wire } from 'lwc';
import getPermissionSet from '@salesforce/apex/PermissionController.getPermissionSet';
import getObjectPermissionsByPermissionSet from '@salesforce/apex/PermissionController.getObjectPermissionsByPermissionSet';


export default class PermissionSetComponent extends LightningElement {

    permissionSets = [];
    selectedPermissionSetId = '';
    showErrors = false;
    showObjectPermissionTable = false;
    @track objectPermissionData = [];

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
        this.selectedPermissionSetId = event.detail.value;
        getObjectPermissionsByPermissionSet({ permissionSetId: this.selectedPermissionSetId })
            .then((result) => {
                this.showObjectPermissionTable = true;
                this.showErrors = false;
                this.objectPermissionData = result;
            })
            .catch((error) => {
                this.showObjectPermissionTable = false;
                this.showErrors = true;
                console.log("Errors encountered in method " + error);
            });
    }
}