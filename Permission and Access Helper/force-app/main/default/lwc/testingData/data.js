import { LightningElement } from 'lwc';

//["TYPE","Name"]
const JsonData=[
    {
        type: 'Profile',
        permissionSetProfileData: [
            {
                permissionTypeData: [
                    {
                        permissionType: 'Object Permissions',
                        permissions: [
                            {
                                value: 'WorkOrder',
                                access: 'Read, View All Records'
                            },
                            {
                                value: 'AssetAction',
                                access: 'Read, View All Records'
                            }
                        ]
                    },
                    {
                        permissionType: 'Field Permissions',
                        permissions: [
                            {
                                value: 'ContactPointEmail.ParentId',
                                access: 'Read, Edit'
                            },
                            {
                                value: 'Product2.DisplayUrl',
                                access: 'Read, Edit'
                            },
                            {
                                value: 'Product2.StockKeepingUnit',
                                access: 'Read, Edit'
                            }
                        ]
                    }
                ],
                name: 'Analytics Cloud Integration User'
            },
            {
                permissionTypeData: [
                    {
                        permissionType: 'Object Permissions',
                        permissions: [
                            {
                                value: 'StreamingChannel',
                                access: 'Read, View All Records'
                            },
                            {
                                value: 'Solution',
                                access: 'Read, View All Records'
                            },
                            {
                                value: 'ServiceContract',
                                access: 'Read, View All Records'
                            }
                        ]
                    },
                    {
                        permissionType: 'Field Permissions',
                        permissions: [
                            {
                                value: 'ContractLineItem.LocationId',
                                access: 'Read, Edit'
                            },
                            {
                                value: 'Individual.HasOptedOutTracking',
                                access: 'Read, Edit'
                            }
                        ]
                    }
                ],
                name: 'Analytics Cloud Security User'
            }
        ]
    },
    {
        type: 'Permission Set',
        permissionSetProfileData: [
            {
                permissionTypeData: [
                    {
                        permissionType: 'Object Permissions',
                        permissions: [
                            {
                                value: 'WorkOrder',
                                access: 'Read, View All Records'
                            },
                            {
                                value: 'ServiceContract',
                                access: 'Read, View All Records'
                            }
                        ]
                    },
                    {
                        permissionType: 'Field Permissions',
                        permissions: [
                            {
                                value: 'ContactPointEmail.ParentId',
                                access: 'Read, Edit'
                            },
                            {
                                value: 'Product2.DisplayUrl',
                                access: 'Read, Edit'
                            }
                        ]
                    }
                ],
                name: 'Testing'
            }
        ]
    }
];

export {JsonData};

    