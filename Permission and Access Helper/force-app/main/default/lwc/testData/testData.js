import { LightningElement } from 'lwc';

const PermissionSetData=[
    {permissionset:"Buyer",Type:'FieldPermissions',Value:'Account.Site',Access:'Read'},
    {permissionset:"Buyer",Type:'FieldPermissions',Value:'Account.Type',Access:'Read'},
    {permissionset:"Buyer",Type:'FieldPermissions',Value:'Product2.Description',Access:'Read'},
    {permissionset:"Buyer",Type:'FieldPermissions',Value:'Product2.Family',Access:'Read,Edit'},
    {permissionset:"Buyer",Type:'FieldPermissions',Value:'Product2.ProductCode',Access:'Read,Edit,Delete'},
    {permissionset:"Buyer",Type:'Object Permission',Value:'Account',Access:'Read, Edit, Delete'},
    {permissionset:"Buyer",Type:'Object Permission',Value:'Contact',Access:'Read'},
    {permissionset:"Buyer",Type:'Object Permission',Value:'Document',Access:'Read'},
    {permissionset:"Buyer",Type:'Object Permission',Value:'Product2 ',Access:'Read'},
    {permissionset:"Buyer Manager",Type:'FieldPermissions',Value:'Account.Site',Access:'Read'},
    {permissionset:"Buyer Manager",Type:'FieldPermissions',Value:'Account.Type',Access:'Read'},
    {permissionset:"Buyer Manager",Type:'FieldPermissions',Value:'Product2.Description',Access:'Read'},
    {permissionset:"Buyer Manager",Type:'FieldPermissions',Value:'Product2.Family',Access:'Read,Edit'},
    {permissionset:"Buyer Manager",Type:'FieldPermissions',Value:'Product2.ProductCode',Access:'Read,Edit,Delete'},
    {permissionset:"Buyer Manager",Type:'Object Permission',Value:'Account',Access:'Read, Edit, Delete'},
    {permissionset:"Buyer Manager",Type:'Object Permission',Value:'Contact',Access:'Read'},
    {permissionset:"Buyer Manager",Type:'Object Permission',Value:'Document',Access:'Read'},
    {permissionset:"Buyer Manager",Type:'Object Permission',Value:'Product2 ',Access:'Read'}
];

const ProfileData=[
    {profile:"Analytics Cloud Integration User",Type:'FieldPermissions',Value:'Account.Site',Access:'Read'},
    {profile:"Analytics Cloud Integration User",Type:'FieldPermissions',Value:'Account.Type',Access:'Read'},
    {profile:"Analytics Cloud Integration User",Type:'FieldPermissions',Value:'Product2.Description',Access:'Read'},
    {profile:"Analytics Cloud Integration User",Type:'FieldPermissions',Value:'Product2.Family',Access:'Read,Edit'},
    {profile:"Analytics Cloud Integration User",Type:'FieldPermissions',Value:'Product2.ProductCode',Access:'Read,Edit,Delete'},
    {profile:"Analytics Cloud Integration User",Type:'Object Permission',Value:'Account',Access:'Read, Edit, Delete'},
    {profile:"Analytics Cloud Integration User",Type:'Object Permission',Value:'Contact',Access:'Read'},
    {profile:"Analytics Cloud Integration User",Type:'Object Permission',Value:'Document',Access:'Read'},
    {profile:"Analytics Cloud Integration User",Type:'Object Permission',Value:'Product2 ',Access:'Read'},
    {profile:"Buyer Manager",Type:'FieldPermissions',Value:'Account.Site',Access:'Read'},
    {profile:"Buyer Manager",Type:'FieldPermissions',Value:'Account.Type',Access:'Read'},
    {profile:"Buyer Manager",Type:'FieldPermissions',Value:'Product2.Description',Access:'Read'},
    {profile:"Buyer Manager",Type:'FieldPermissions',Value:'Product2.Family',Access:'Read,Edit'},
    {profile:"Buyer Manager",Type:'FieldPermissions',Value:'Product2.ProductCode',Access:'Read,Edit,Delete'},
    {profile:"Buyer Manager",Type:'Object Permission',Value:'Account',Access:'Read, Edit, Delete'},
    {profile:"Buyer Manager",Type:'Object Permission',Value:'Contact',Access:'Read'},
    {profile:"Buyer Manager",Type:'Object Permission',Value:'Document',Access:'Read'},
    {profile:"Buyer Manager",Type:'Object Permission',Value:'Product2 ',Access:'Read'}
];

export {PermissionSetData,ProfileData};
export default class TestData extends LightningElement {
    
}