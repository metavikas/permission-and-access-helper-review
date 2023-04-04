export const sample = [
    {
        type: 'Profile',
        rowspan: 17,
        permissionSetProfileData: [
            {
                rowspan: 8,
                permissionTypeData: [
                    {
                        permissionType: 'Object Permissions',
                        rowspan: 3,
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
                        rowspan: 4,
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
                rowspan: 8,
                permissionTypeData: [
                    {
                        permissionType: 'Object Permissions',
                        rowspan: 4,
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
                        rowspan: 3,
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
        rowspan: 8,
        permissionSetProfileData: [
            {
                rowspan: 7,
                permissionTypeData: [
                    {
                        permissionType: 'Object Permissions',
                        rowspan: 3,
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
                        rowspan: 3,
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
