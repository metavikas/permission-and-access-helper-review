import { LightningElement, api } from 'lwc';

const columns = [
    { label: 'Object Label', fieldName: 'label' },
    { label: 'Object Api Name', fieldName: 'apiName' },
    { label: 'Read Permission', fieldName: 'Read' },
    { label: 'Create Permission', fieldName: 'Create' },
    { label: 'Edit Permission', fieldName: 'Edit' },
    { label: 'Delete Permission', fieldName: 'Delete' },
    { label: 'View All Records Permission', fieldName: 'ViewAllRecords' },
    { label: 'Modify All Records Permission', fieldName: 'ModifyAllRecords' },
];

export default class TableForData extends LightningElement {
    @api
    get renderData(){
        return this.data;
    }
    set renderData(value) {
        console.log("came in setter for renderData");
        this.data = value.map((item) => ({
            "label": item["label"],
            "apiName": item["apiName"],
            "Read": item["permissions"]["Read"],
            "Create": item["permissions"]["Create"],
            "Edit": item["permissions"]["Edit"],
            "Delete": item["permissions"]["Delete"],
            "ViewAllRecords": item["permissions"]["ViewAllRecords"],
            "ModifyAllRecords": item["permissions"]["ModifyAllRecords"]
        }));

        console.log("The data made is " + JSON.stringify(this.data.slice(0, 10)));
    }
    data = [];
    columns = columns;
}