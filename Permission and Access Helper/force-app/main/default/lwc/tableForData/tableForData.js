import { LightningElement, api, track } from 'lwc';

export default class TableForData extends LightningElement {

    @api hideCheckboxColumn = false;
    @api columns = [];
    @api
    get renderData() {
        return this.data;
    }
    set renderData(value) {
        this.data = value.map((item) => {
            return {
                id: item.Id,
                label: item.label,
                apiName: item.apiName,
                ...Object.keys(item.permissions).reduce((temp, permissionItem) => ({
                    ...temp,
                    [permissionItem]: item.permissions[permissionItem]
                }
                ), {})
            };
        });
    }

    data = [];

    sendSelectedRowData(event) {
        this.dispatchEvent(new CustomEvent("rowselected", {
            detail: {
                apiName: event.detail.selectedRows[0].apiName
            }
        }));
    }

    get showNoDataImage() {
        return !this.data.length;
    }
}