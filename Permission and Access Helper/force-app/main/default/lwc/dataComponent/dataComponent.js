import { LightningElement } from 'lwc';
import { sample } from './data';
const columns=[{ label:'Type'},
                {label:'Name'},
                {label:'Permission Type'},
                {label:'Value'},
                {label:'Access'}
]
export default class DataComponent extends LightningElement {
    reqData=sample;
    columns=columns;
    value='All';
    get options(){
        return[{ label: 'All', value: 'all' },
        { label: 'Profile', value: 'profile' },
        { label: 'Permission Set', value: 'permissionset' },
        {label: 'Objects', value: 'object'},
        {label: 'Fields', value: 'fields'}];
    }
connectedCallback(){
   console.log("this is final without->"+JSON.stringify(this.filterObjects('WorkOrder')));
   console.log("this is final reqData->"+JSON.stringify(this.convertData(this.filterObjects('WorkOrder'))));
}


convertData(convArray){
    const alldata=convArray;

alldata.forEach(permEle=>{
   
const permissionSetProfileData=permEle.permissionSetProfileData;
let permRowSpanValue=0;
permissionSetProfileData.forEach(permDataEle=>{
   
    const permTypeData= permDataEle.permissionTypeData;
    let nameRowspanvalue=0;
    permTypeData.forEach(objfieldPermEle=>{
       
        objfieldPermEle.rowspan=objfieldPermEle.permissions.length+1;
        nameRowspanvalue+=objfieldPermEle.rowspan;
    });
   
    permDataEle.rowspan=nameRowspanvalue+1;
    permRowSpanValue+=permDataEle.rowspan;
});

permEle.rowspan=permRowSpanValue+1;
});
 console.log(alldata);
 return alldata;
}

filterPermissionSetAndProfile(type,nameField){
    let filterProfileData=this.reqData;
    let result= filterProfileData.filter((item)=>{
        if(item.type===type){
            return item;
        }
    });
    result.forEach(typeEle=>{
        let permNameArray=typeEle.permissionSetProfileData;
        permNameArray=permNameArray.filter(item=>{
            if(item.name===nameField){
                return item;
            }
        });
        typeEle.permissionSetProfileData=[...permNameArray];
    });

    return result;
}

filterObjects(objName){
    let filterObjArray=this.reqData;
    filterObjArray.forEach(permEle=>{
        let permissionSetProfileData=permEle.permissionSetProfileData;
        permissionSetProfileData.forEach(permNameEle=>{
            let permissionTypeData= permNameEle.permissionTypeData;
            permissionTypeData.forEach(permtypeEle=>{
                let permissions= permtypeEle.permissions;
                permissions=permissions.filter(item=>{
                    if(item.value===objName){
                        return item;
                    }
                });
                permtypeEle.permissions=[...permissions];
            });
            permissionTypeData=permissionTypeData.filter(item=>{
                    if(item.permissionType === 'Object Permissions' && item.permissions.length>0){
                        return item;
                    }
                });
                permNameEle.permissionTypeData=[... permissionTypeData]  ; 
        });
        permEle.permissionSetProfileData=permEle.permissionSetProfileData.filter(item=>{
            if(item.permissionTypeData.length>0){
                return item;
            }
        });
        console.log("Final req Array->"+JSON.stringify(permEle.permissionSetProfileData));
    });
    return filterObjArray;
}

filterFields(objName,fieldName){
    let filterFieldsArray=this.reqData;
    let searchField=objName+'.'+fieldName;
    filterFieldsArray.forEach(permEle=>{
        let permissionSetProfileData=permEle.permissionSetProfileData;
        permissionSetProfileData.forEach(permNameEle=>{
            let permissionTypeData =permNameEle.permissionTypeData;
            permissionTypeData.forEach(permTypeEle=>{
                let permissions=permTypeEle.permissions;
                permTypeEle.permissions=permissions.filter(item=>{
                    if(item.value===searchField){
                        return item;
                    }
                });
            });
            permissionTypeData= permissionTypeData.filter(item=>{
                if(item.permissions.length>0){
                    return item;
                }
            });
            permNameEle.permissionTypeData=[... permissionTypeData];
        });
        permEle.permissionSetProfileData=permissionSetProfileData.filter(item=>{
            if(item.permissionTypeData.length>0){
                return item;
            }
            
        });
    });
    return filterFieldsArray;
}
}