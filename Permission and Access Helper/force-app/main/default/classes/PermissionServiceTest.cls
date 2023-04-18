@isTest
private with sharing class PermissionServiceTest {
    @isTest
    private static void testGetAllProfiles_shouldReturnAllProfiles(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
		IProfileSelector selectorMock = new Mocks.ProfileSelector(mocks);

        //Given
        mocks.startStubbing();
        // Profile p1 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
        // Profile p2 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
        Profile p1 = new Profile(Id = '00e2w000005SOrWAAW', Name = 'Analytics Cloud Integration User');
        Profile p2 = new Profile(Id = '00e2w000005SOrcAAG', Name = 'Analytics Cloud Security User');
        List<Profile> profileList= new List<Profile>{p1,p2};
        mocks.when(selectorMock.sObjectType()).thenReturn(Profile.SObjectType);
        mocks.when(selectorMock.getAllRecords()).thenReturn(profileList);
        ComboboxDataWrapper forCheck1 = new ComboboxDataWrapper(p1.Name, p1.Id);
        ComboboxDataWrapper forCheck2 = new ComboboxDataWrapper(p2.Name, p2.Id);
        List<ComboboxDataWrapper> forCheck = new List<ComboboxDataWrapper>{forCheck1,forCheck2};
        mocks.stopStubbing();
        PermissionApplication.Selector.setMock(selectorMock);

        //When
        Test.startTest();
        List<ComboboxDataWrapper> recievedProfileList = PermissionService.getProfile();
        Test.stopTest();

        //Then
        ((IProfileSelector)mocks.verify(selectorMock)).getAllRecords();
        
        // System.assertEquals(recievedProfileList.size(),profileList.size());
        //  System.assertEquals(recievedProfileList[0].label,'Test');
    }
    @isTest
    private static void testGetAllPermissionSet_shouldReturnAllPermissionSet(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
		IPermissionSetSelector selectorMock = new Mocks.PermissionSetSelector(mocks);

        //Given
        mocks.startStubbing();
        PermissionSet p1 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType),Name='Test', label = 'Test');
        PermissionSet p2 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType),Name='Test', label = 'Test');
        List<PermissionSet> permissionSetList= new List<PermissionSet>{p1,p2};
        mocks.when(selectorMock.sObjectType()).thenReturn(PermissionSet.SObjectType);
        mocks.when(selectorMock.getAllRecords()).thenReturn(permissionSetList);
        ComboboxDataWrapper forCheck1 = new ComboboxDataWrapper(p1.label, p1.Id);
        ComboboxDataWrapper forCheck2 = new ComboboxDataWrapper(p2.label, p2.Id);
        List<ComboboxDataWrapper> forCheck = new List<ComboboxDataWrapper>{forCheck1,forCheck2};
        mocks.stopStubbing();
        PermissionApplication.Selector.setMock(selectorMock);
        //When
        Test.startTest();
        List<ComboboxDataWrapper> recievedPermissionSetList = PermissionService.getPermissionSet();
        Test.stopTest();

        //Then
        ((IPermissionSetSelector)mocks.verify(selectorMock)).getAllRecords();
    //    System.assertEquals(recievedPermissionSetList.size(),permissionSetList.size());
    //    System.assertEquals(recievedPermissionSetList[0].label,'Test');         

    }

    @isTest 
    private static void testGetAllPermissoinData_shouldReturnAllData(){
        // mocks
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IProfileSelector profileSelectorMock = new Mocks.ProfileSelector(mocks);
        IPermissionSetSelector permissionSetSelectorMock = new Mocks.PermissionSetSelector(mocks);
        IObjectPermissionSelector objectPermissionSelectorMock =new Mocks.ObjectPermissionSelector(mocks);
        IFieldPermissionSelector fieldPermissionSelectorMock= new Mocks.FieldPermissionSelector(mocks);

        // profile
        List<Profile> profileList= [SELECT Id, Name FROM Profile WHERE Name ='Standard User'];

        // permission
        PermissionSet ps1 = new PermissionSet(Id = '0PS2w000009MPBeGAO', Name='B2BBuyerManager',label = 'Buyer Manager');
        PermissionSet ps2 = [SELECT Id, Name, Label,IsOwnedByProfile,ProfileId FROM PermissionSet WHERE Profile.Name ='Standard User'];
        System.debug('This is ps2-> '+ps2);
        List<PermissionSet> permissionSetList= new List<PermissionSet>{ps1, ps2};


        // fieldPermission
        // FieldPermissions fp1 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()));
        // FieldPermissions fp2 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()));
        //FieldPermissions fp1 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()), ParentId=ps2.Id, SobjectType='Account', Field='Account.Active__c', PermissionsEdit=true, PermissionsRead=true);
		FieldPermissions fp1=[SELECT SobjectType, Field, Id, ParentId,Parent.IsOwnedByProfile,Parent.ProfileId, PermissionsEdit, PermissionsRead FROM FieldPermissions WHERE Field='Account.Active__c' AND ParentId=:ps2.Id];
        FieldPermissions fp2 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()), ParentId=ps2.Id, SobjectType='Account', Field='Account.CustomerPriority__c', PermissionsEdit=true, PermissionsRead=true);
        List<FieldPermissions> fpList=new List<FieldPermissions>{fp1,fp2};

        //ObjectPermission
        // ObjectPermissions op1=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()));
        // ObjectPermissions op2=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()));
        //ObjectPermissions op1 = new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()),ParentId=ps2.Id,SObjectType='WorkOrder',PermissionsCreate=true,PermissionsRead=true,PermissionsEdit=true,PermissionsDelete=true,PermissionsViewAllRecords=true,PermissionsModifyAllRecords=true);
        ObjectPermissions op1= [SELECT Id, ParentId, SobjectType,Parent.IsOwnedByProfile,Parent.ProfileId, PermissionsCreate, PermissionsRead, PermissionsEdit, PermissionsDelete, PermissionsViewAllRecords, PermissionsModifyAllRecords FROM ObjectPermissions WHERE SobjectType='WorkOrder' AND ParentId=:ps2.Id ];

        ObjectPermissions op2 = new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()),ParentId=ps2.Id,SObjectType='StreamingChannel',PermissionsCreate=true,PermissionsRead=true,PermissionsEdit=true,PermissionsDelete=true,PermissionsViewAllRecords=true,PermissionsModifyAllRecords=true);

        ObjectPermissions op3 = new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()),ParentId=ps1.Id,SObjectType='PrivacyConsent',PermissionsCreate=true,PermissionsRead=true,PermissionsEdit=true,PermissionsDelete=true,PermissionsViewAllRecords=true,PermissionsModifyAllRecords=true);
        List<ObjectPermissions> opList=new List<ObjectPermissions>{op1,op2,op3};

        mocks.startStubbing();
        mocks.when(profileSelectorMock.getAllRecords()).thenReturn(profileList);
        mocks.when(profileSelectorMock.sObjectType()).thenReturn(Profile.sObjectType);
        mocks.when(permissionSetSelectorMock.getAllRecords()).thenReturn(permissionSetList);
        mocks.when(permissionSetSelectorMock.sObjectType()).thenReturn(PermissionSet.sObjectType);
        mocks.when(objectPermissionSelectorMock.getAllRecords()).thenReturn(opList);
        mocks.when(objectPermissionSelectorMock.sObjectType()).thenReturn(ObjectPermissions.getSObjectType());
        mocks.when(fieldPermissionSelectorMock.getAllRecords()).thenReturn(fpList);
        mocks.when(fieldPermissionSelectorMock.sObjectType()).thenReturn(FieldPermissions.getSObjectType());
        mocks.stopStubbing();
        
        PermissionApplication.Selector.setMock(profileSelectorMock);
        PermissionApplication.Selector.setMock(permissionSetSelectorMock);
        PermissionApplication.Selector.setMock(objectPermissionSelectorMock);
        PermissionApplication.Selector.setMock(fieldPermissionSelectorMock);

        Test.startTest();
        List<PermissionDataWrapper> res= PermissionService.getAllPermissionData();
        System.debug(res);
        Test.stopTest();

        ((IProfileSelector)mocks.verify(profileSelectorMock)).getAllRecords();
        ((IPermissionSetSelector)mocks.verify(permissionSetSelectorMock)).getAllRecords();
        ((IObjectPermissionSelector)mocks.verify(objectPermissionSelectorMock)).getAllRecords();
        ((IFieldPermissionSelector)mocks.verify(fieldPermissionSelectorMock)).getAllRecords();      
    }

    @isTest
    private static void test_service_getObjectOptionsForObjectPermissions_shouldReturnAllObjectPermission(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IObjectPermissionSelector objectPermissionSelectorMock= new Mocks.ObjectPermissionSelector(mocks);

        ObjectPermissions op1=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()),SObjectType='Account',PermissionsCreate=true, PermissionsRead=true, PermissionsEdit=true, PermissionsDelete=true, PermissionsViewAllRecords=true, PermissionsModifyAllRecords=true);
        ObjectPermissions op2=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()),SObjectType='Test2',PermissionsCreate=true, PermissionsRead=true, PermissionsEdit=true, PermissionsDelete=true, PermissionsViewAllRecords=true, PermissionsModifyAllRecords=true);
        List<ObjectPermissions> opList=new List<ObjectPermissions>{op1,op2};

        ComboboxDataWrapper objPermWrapper1 = new ComboboxDataWrapper( op1.SObjectType,op1.SObjectType);
        ComboboxDataWrapper objPermWrapper2 = new ComboboxDataWrapper( op2.SObjectType,op2.SObjectType);
        List<ComboboxDataWrapper> sentObjPermWrapper= new List<ComboboxDataWrapper>{objPermWrapper1,objPermWrapper2};

        mocks.startStubbing();
        mocks.when(objectPermissionSelectorMock.getAllRecords()).thenReturn(opList);
        mocks.when(objectPermissionSelectorMock.sObjectType()).thenReturn(ObjectPermissions.getSObjectType());
        mocks.stopStubbing();

        PermissionApplication.Selector.setMock(objectPermissionSelectorMock);

        test.startTest();
        List<ComboboxDataWrapper> result= PermissionService.getObjectOptionsForObjectPermissions();
        system.debug(result);
        test.stopTest();

        ((IObjectPermissionSelector) mocks.verify(objectPermissionSelectorMock)).getAllRecords();
        // System.assertEquals(sentObjPermWrapper[0].label, result[0].label);
        // System.assertEquals(sentObjPermWrapper[0].value, result[0].value);
    }

    @isTest
    private static void test_service_getObjectOptionsForFieldPermissions_shouldReturnAllFieldOptions(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IFieldPermissionSelector fieldPermissionSelectorMock= new Mocks.FieldPermissionSelector(mocks);

        FieldPermissions fp1 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Account');
        FieldPermissions fp2 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Test2');
        List<FieldPermissions> fpList=new List<FieldPermissions>{fp1,fp2};
        ComboboxDataWrapper fldPermWrapper1 = new ComboboxDataWrapper( fp1.SObjectType,fp1.SObjectType);
        ComboboxDataWrapper fldPermWrapper2 = new ComboboxDataWrapper( fp2.SObjectType,fp2.SObjectType);

        List<ComboboxDataWrapper> sentFldPermWrapper= new List<ComboboxDataWrapper>{fldPermWrapper1,fldPermWrapper2};
        mocks.startStubbing();
        mocks.when(fieldPermissionSelectorMock.getAllRecords()).thenReturn(fpList);
        mocks.when(fieldPermissionSelectorMock.sObjectType()).thenReturn(FieldPermissions.getSObjectType());
        mocks.stopStubbing();

        PermissionApplication.Selector.setMock(fieldPermissionSelectorMock);
        Test.startTest();
        List<ComboboxDataWrapper> result= PermissionService.getObjectOptionsForFieldPermissions();
        Test.stopTest();

        ((IFieldPermissionSelector)mocks.verify(fieldPermissionSelectorMock)).getAllRecords();
        //System.assertEquals(sentFldPermWrapper, result);
        // System.assertEquals(sentFldPermWrapper[0].label, result[0].label);
        // System.assertEquals(sentFldPermWrapper[0].value, result[0].value);
    }

    @isTest
    private static void test_service_getFieldOptionsByObject_shouldReturnAllFieldPermissions(){
        fflib_ApexMocks mocks= new fflib_ApexMocks();
        IFieldPermissionSelector fieldPermissionSelectorMock= new Mocks.FieldPermissionSelector(mocks);

        FieldPermissions fp1 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Account',Field='Account.Active__c');
        FieldPermissions fp2 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Account',Field='Account.CustomerPriority__c');
        List<FieldPermissions> fpList=new List<FieldPermissions>{fp1,fp2};

        ComboboxDataWrapper fldPermWrapper1 = new ComboboxDataWrapper( 'Active','Active__c');
        ComboboxDataWrapper fldPermWrapper2 = new ComboboxDataWrapper( 'CustomerPriority','CustomerPriority__c');

        List<ComboboxDataWrapper> sentFldPermWrapper= new List<ComboboxDataWrapper>{fldPermWrapper1,fldPermWrapper2};

        mocks.startStubbing();
        mocks.when(fieldPermissionSelectorMock.getRecordsByObject('Account')).thenReturn(fpList);
        mocks.when(fieldPermissionSelectorMock.sObjectType()).thenReturn(FieldPermissions.getSObjectType());
        mocks.stopStubbing();

        PermissionApplication.Selector.setMock(fieldPermissionSelectorMock);

        Test.startTest();
        List<ComboboxDataWrapper> result = PermissionService.getFieldOptionsByObject('Account');
        System.debug(result);
        Test.stopTest();

        ((IFieldPermissionSelector)mocks.verify(fieldPermissionSelectorMock)).getRecordsByObject('Account');
        //System.assertEquals(sentFldPermWrapper, result);
        // System.assertEquals(sentFldPermWrapper[0].label, result[0].label);
        // System.assertEquals(sentFldPermWrapper[0].value, result[0].value);
        
    }
}
