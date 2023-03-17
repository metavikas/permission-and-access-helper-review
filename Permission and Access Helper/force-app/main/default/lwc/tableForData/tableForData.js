import { LightningElement, api } from 'lwc';

const columns = [
    { label: 'Object Label', fieldName: 'label'},
    { label: 'Object Api Name', fieldName: 'apiName' },
    { label: 'Read', fieldName: 'Read', type: 'boolean' },
    { label: 'Create', fieldName: 'Create', type: 'boolean'  },
    { label: 'Edit', fieldName: 'Edit', type: 'boolean'  },
    { label: 'Delete', fieldName: 'Delete', type: 'boolean'  },
    { label: 'View All Records', fieldName: 'ViewAllRecords', type: 'boolean'  },
    { label: 'Modify All Records', fieldName: 'ModifyAllRecords', type: 'boolean'  },
];

export default class TableForData extends LightningElement {
    @api
    get renderData() {
        return this.data;
    }
    set renderData(value) {
        console.log("came in setter for renderData");
        try {
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
        }catch(e){
            console.log("The error encountered is " + e);
        }
        console.log("The data made is " + JSON.stringify(this.data.slice(0, 10)));
    }
    data = [];
    columns = columns;
}