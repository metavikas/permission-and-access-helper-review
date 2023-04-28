import { LightningElement } from 'lwc';
import getAllPermissionData from '@salesforce/apex/PermissionController.getAllPermissionData';
import getProfiles from '@salesforce/apex/PermissionController.getProfiles';
import getPermissionSets from '@salesforce/apex/PermissionController.getPermissionSets';
import getObjectOptionsForObjectPermissions from '@salesforce/apex/PermissionController.getObjectOptionsForObjectPermissions';
import getObjectOptionsForFieldPermissions from '@salesforce/apex/PermissionController.getObjectOptionsForFieldPermissions';
import getFieldOptionsByObject from '@salesforce/apex/PermissionController.getFieldOptionsByObject';

const filterOptions = [
    { label: 'All', value: 'All' },
    { label: 'Profile', value: 'Profile' },
    { label: 'Permission Set', value: 'Permission Set' },
    { label: 'Object', value: 'Object' },
    { label: 'Field', value: 'Field' },
];

export default class PermissionAndAccessHelper extends LightningElement {
    filterOptions = filterOptions;
    isComboboxLoading = false;
    isLoading = true;
    selectedFilterType = 'All';
    selectedDataValue = '';
    selectedDataLabel;
    fieldComboboxDisabled = false;
    dataComboboxDisabled = false;
    selectedField = '';
    selectedFieldLabel = '';
    optionsForDataFilter = [];
    optionsForFieldFilter = [];
    placeholderForDataFilter = '';
    isObjectSelected = false;
    allData = [];
    visibleData = [];


    get dataToRender() {
        return this.visibleData;
    }

    get isFilterTypeSelected() {
        if (this.selectedFilterType === 'All') {
            return false;
        }
        return true;
    }

    get isFilterTypeField() {
        if (this.selectedFilterType === 'Field') {
            return true;
        }
        return false;
    }

    async connectedCallback() {
        try {
            this.isLoading = true;
            this.allData = await getAllPermissionData();
            console.log(JSON.stringify(this.allData));
        } catch (e) {
            console.log("Error found in connected callback as " + e);
        }
        this.visibleData = this.allData;
        this.isLoading = false;
    }

    async handleFilterTypeChange(event) {
        this.selectedDataLabel = '';
        this.selectedDataValue = '';
        this.isComboboxLoading = true;
        await new Promise((resolve) => {
            // eslint-disable-next-line @lwc/lwc/no-async-operation
            setTimeout(() => {
                resolve();
            }, 20);
        });
        this.selectedFilterType = event.detail.value;
        this.visibleData = this.allData;
        this.dataComboboxDisabled = true;
        if (this.selectedFilterType === 'All') {
            this.visibleData = this.allData;
            this.isComboboxLoading = false;
        } else if (this.selectedFilterType === 'Profile') {
            this.placeholderForDataFilter = 'Select a Profile';
            this.selectedDataValue = '';
            getProfiles()
                .then((result) => {
                    this.optionsForDataFilter = result;
                    this.dataComboboxDisabled = false;
                    this.isComboboxLoading = false;
                })
                .catch((error) => {
                    console.log("Error encountered in getProfile() ", error);
                })
        } else if (this.selectedFilterType === 'Permission Set') {
            this.placeholderForDataFilter = 'Select a Permission Set';
            this.selectedDataValue = '';
            getPermissionSets()
                .then((result) => {
                    this.optionsForDataFilter = result;
                    this.dataComboboxDisabled = false;
                    this.isComboboxLoading = false;
                })
                .catch((error) => {
                    console.log("Error encountered in getPermissionSet() ", error);
                })
        } else if (this.selectedFilterType === 'Object') {
            this.placeholderForDataFilter = 'Select an Object';
            this.selectedDataValue = '';
            getObjectOptionsForObjectPermissions()
                .then((result) => {
                    this.optionsForDataFilter = result;
                    this.dataComboboxDisabled = false;
                    this.isComboboxLoading = false;
                })
                .catch((error) => {
                    console.log("Error encountered in getOjbectOptionsForObjectPermissions() ", error);
                })
        } else if (this.selectedFilterType === 'Field') {
            this.placeholderForDataFilter = 'Select an Object';
            this.fieldComboboxDisabled = true;
            this.selectedDataValue = '';
            getObjectOptionsForFieldPermissions()
                .then((result) => {
                    this.optionsForDataFilter = result;
                    this.dataComboboxDisabled = false;
                    this.isComboboxLoading = false;
                })
                .catch((error) => {
                    console.log("Error encountered in getOjbectOptionsForFieldPermissions() ", error);
                })
        }
    }

    handleDataFilterChange(event) {
        try {
            this.selectedDataValue = event.detail.value;
            this.selectedDataLabel = event.detail.label;
            if (this.selectedFilterType === 'Profile' || this.selectedFilterType === 'Permission Set') {
                this.visibleData = this.convertData(this.filterPermissionSetAndProfile(this.selectedFilterType, this.selectedDataValue));
            }
            if (this.selectedFilterType === 'Object') {
                this.visibleData = this.convertData(this.filterObjects(this.selectedDataValue));
            }
            if (this.selectedFilterType === 'Field') {
                this.isObjectSelected = true;
                this.selectedFieldLabel = '';
                this.selectedField = '';
                this.fieldComboboxDisabled = true;
                getFieldOptionsByObject({ objectName: this.selectedDataValue })
                    .then((result) => {
                        this.optionsForFieldFilter = result;
                        this.fieldComboboxDisabled = false;
                    })
                    .catch((error) => {
                        console.log("Error encountered in getFieldOptionsByObject() ", error);
                    })
            }
        } catch (e) {
            console.log("eerrror rdfklajffjaljfl", e);
        }
    }

    handleFieldChange(event) {
        try {
            this.selectedField = event.detail.value;
            this.selectedFieldLabel = event.detail.label;
            this.visibleData = this.convertData(this.filterFields(this.selectedDataValue, this.selectedField));
        } catch (e) {
            console.log("Error is such that ", e);
        }
    }

    filterPermissionSetAndProfile(type, idField) {
        let filterProfileData = JSON.parse(JSON.stringify(this.allData));
        filterProfileData = filterProfileData.filter((item) => {
            if (item.type === type) {
                return item;
            }
        });
        filterProfileData.forEach((typeEle) => {
            let permNameArray = typeEle.permissionSetProfileData;
            permNameArray = permNameArray.filter(item => {
                if (item.id === idField) {
                    return item;
                }
            });
            typeEle.permissionSetProfileData = [...permNameArray];
        });
        return filterProfileData;
    }

    filterObjects(objName) {
        let filterObjArray = JSON.parse(JSON.stringify(this.allData));
        filterObjArray.forEach(permEle => {
            let permissionSetProfileData = permEle.permissionSetProfileData;
            permissionSetProfileData.forEach(permNameEle => {
                let permissionTypeData = permNameEle.permissionTypeData;
                permissionTypeData.forEach(permtypeEle => {
                    let permissions = permtypeEle.permissions;
                    permissions = permissions.filter(item => {
                        if (item.value.toLowerCase() === objName.toLowerCase()) {
                            return item;
                        }
                    });
                    permtypeEle.permissions = [...permissions];
                });
                permissionTypeData = permissionTypeData.filter(item => {
                    if (item.permissionType === 'Object Permissions' && item.permissions.length > 0) {
                        return item;
                    }
                });
                permNameEle.permissionTypeData = [...permissionTypeData];
            });
            permEle.permissionSetProfileData = permEle.permissionSetProfileData.filter(item => {
                if (item.permissionTypeData.length > 0) {
                    return item;
                }
            });
        });
        filterObjArray = filterObjArray.filter(item => {
            if (item.permissionSetProfileData.length !== 0) {
                return item;
            }
        })
        return filterObjArray;
    }

    filterFields(objName, fieldName) {
        let filterFieldsArray = JSON.parse(JSON.stringify(this.allData));
        let searchField = objName + '.' + fieldName;
        filterFieldsArray.forEach(permEle => {
            let permissionSetProfileData = permEle.permissionSetProfileData;
            permissionSetProfileData.forEach(permNameEle => {
                let permissionTypeData = permNameEle.permissionTypeData;
                permissionTypeData.forEach(permTypeEle => {
                    let permissions = permTypeEle.permissions;
                    permTypeEle.permissions = permissions.filter(item => {
                        if (item.value.toLowerCase() === searchField.toLowerCase()) {
                            return item;
                        }
                    });
                });
                permissionTypeData = permissionTypeData.filter(item => {
                    if (item.permissions.length > 0) {
                        return item;
                    }
                });
                permNameEle.permissionTypeData = [...permissionTypeData];
            });
            permEle.permissionSetProfileData = permissionSetProfileData.filter(item => {
                if (item.permissionTypeData.length > 0) {
                    return item;
                }
            });
        });
        filterFieldsArray = filterFieldsArray.filter(item => {
            if (item.permissionSetProfileData.length !== 0) {
                return item;
            }
        })
        return filterFieldsArray;
    }

    convertData(convArray) {
        const alldata = convArray;
        alldata.forEach(permEle => {
            const permissionSetProfileData = permEle.permissionSetProfileData;
            let permRowSpanValue = 0;
            permissionSetProfileData.forEach(permDataEle => {
                const permTypeData = permDataEle.permissionTypeData;
                let nameRowspanvalue = 0;
                permTypeData.forEach(objfieldPermEle => {
                    objfieldPermEle.rowspan = objfieldPermEle.permissions.length + 1;
                    nameRowspanvalue += objfieldPermEle.rowspan;
                });
                permDataEle.rowspan = nameRowspanvalue + 1;
                permRowSpanValue += permDataEle.rowspan;
            });
            permEle.rowspan = permRowSpanValue + 1;
        });
        return alldata;
    }
}