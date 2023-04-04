@isTest
public with sharing class TestPermissionAccessHelper {
    @isTest
    private static void testGetAllProfiles_shouldReturnAllProfiles(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
		IProfileSelector selectorMock = new Mocks.ProfileSelector(mocks);

        //Given
        mocks.startStubbing();
        Profile p1 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
        Profile p2 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
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
        
        System.assertEquals(recievedProfileList.size(),profileList.size());
         System.assertEquals(recievedProfileList[0].label,'Test');
    }
    @isTest
    private static void testGetAllPermissionSet_shouldReturnAllPermissionSet(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
		IPermissionSetSelector selectorMock = new Mocks.PermissionSetSelector(mocks);

        //Given
        mocks.startStubbing();
        PermissionSet p1 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType), label = 'Test');
        PermissionSet p2 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType), label = 'Test');
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
       // System.assertEquals(forCheck ,recievedPermissionSetList); 
       System.assertEquals(recievedPermissionSetList.size(),permissionSetList.size());
       System.assertEquals(recievedPermissionSetList[0].label,'Test');         

    }

    @isTest 
    private static void testGetAllPermissoinData_shouldReturnAllData(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IProfileSelector profileSelectorMock = new Mocks.ProfileSelector(mocks);
        IPermissionSetSelector permissionSetSelectorMock = new Mocks.PermissionSetSelector(mocks);
        IObjectPermissionSelector objectPermissionSelectorMock =new Mocks.ObjectPermissionSelector(mocks);
        IFieldPermissionSelector fieldPermissionSelectorMock= new Mocks.FieldPermissionSelector(mocks);
        // profile
        Profile p1 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
        Profile p2 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
        List<Profile> profileList= new List<Profile>{p1,p2};

        // permission
        PermissionSet ps1 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType), label = 'Test');
        PermissionSet ps2 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType), label = 'Test');
        List<PermissionSet> permissionSetList= new List<PermissionSet>{ps1,ps2};


        // fieldPermission
        FieldPermissions fp1 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()));
        FieldPermissions fp2 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()));
        List<FieldPermissions> fpList=new List<FieldPermissions>{fp1,fp2};

        //ObjectPermission
        ObjectPermissions op1=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()));
        ObjectPermissions op2=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()));
        List<ObjectPermissions> opList=new List<ObjectPermissions>{op1,op2};
        mocks.startStubbing();
        mocks.when(profileSelectorMock.getAllRecords()).thenReturn(profileList);
        mocks.when(permissionSetSelectorMock.getAllRecords()).thenReturn(permissionSetList);
        mocks.when(objectPermissionSelectorMock.getAllRecords()).thenReturn(opList);
        mocks.when(fieldPermissionSelectorMock.getAllRecords()).thenReturn(fpList);
        mocks.stopStubbing();
        PermissionApplication.Selector.setMock(profileSelectorMock);
        Test.startTest();
        List<PermissionDataWrapper> res= PermissionService.getAllPermissionData();
        System.debug(res);
        Test.stopTest();

        ((IProfileSelector)mocks.verify(profileSelectorMock)).getAllRecords();


    }
    
}



