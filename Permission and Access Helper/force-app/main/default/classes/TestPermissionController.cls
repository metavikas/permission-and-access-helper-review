@isTest 
public with sharing class TestPermissionController {
    @isTest
    private static void getProfile_shouldReturnAllProfile(){

        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IPermissionService serviceMock = (IPermissionService)mocks.mock(PermissionServiceImpl.class);

        //Given
        mocks.startStubbing();
        Profile p1 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
        Profile p2 = new Profile(Id = fflib_IDGenerator.generate(Profile.SObjectType), Name = 'Test');
        List<Profile> profileList= new List<Profile>{p1,p2};
        ComboboxDataWrapper forCheck1 = new ComboboxDataWrapper(p1.Name, p1.Id);
        ComboboxDataWrapper forCheck2 = new ComboboxDataWrapper(p2.Name, p2.Id);
        List<ComboboxDataWrapper> forCheck = new List<ComboboxDataWrapper>{forCheck1,forCheck2};
        mocks.when(serviceMock.getProfile()).thenReturn(forCheck);
        
		mocks.stopStubbing();
		PermissionApplication.Service.setMock(IPermissionService.class,serviceMock);

        //When
        Test.startTest();
        List<ComboboxDataWrapper> recievedProfileList = PermissionController.getProfile();
        Test.stopTest();


        //Then
        ((IPermissionService)mocks.verify(serviceMock)).getProfile();
        System.assertEquals(forCheck , recievedProfileList);

    }

     @isTest 
    private static void getPermissionSet_shouldReturnAllPermissionSet(){

        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IPermissionService serviceMock = (IPermissionService)mocks.mock(PermissionServiceImpl.class);

        //Given
        mocks.startStubbing();
        PermissionSet p1 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType), label = 'Test');
        PermissionSet p2 = new PermissionSet(Id = fflib_IDGenerator.generate(PermissionSet.SObjectType), label = 'Test');
        List<PermissionSet> permissionSetList= new List<PermissionSet>{p1,p2};

       
        ComboboxDataWrapper forCheck1 = new ComboboxDataWrapper(p1.label, p1.Id);
        ComboboxDataWrapper forCheck2 = new ComboboxDataWrapper(p2.label, p2.Id);
        List<ComboboxDataWrapper> forCheck = new List<ComboboxDataWrapper>{forCheck1,forCheck2};
		
        mocks.when(serviceMock.getPermissionSet()).thenReturn(forCheck);
        mocks.stopStubbing();
		PermissionApplication.Service.setMock(IPermissionService.class,serviceMock);

        //When
        Test.startTest();
        List<ComboboxDataWrapper> recievedPermissionList = PermissionController.getPermissionSet();
        Test.stopTest();


        //Then
        ((IPermissionService)mocks.verify(serviceMock)).getPermissionSet();
        System.assertEquals(forCheck , recievedPermissionList);

    }

    @isTest
    private static void  test_getAllPermissionData_shouldReturnAllPermissionData(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IPermissionService serviceMock = (IPermissionService)mocks.mock(PermissionServiceImpl.class);
        
       PermissionDataWrapper dataWrapperObj1= new PermissionDataWrapper();
       dataWrapperObj1.type='Test1';
       dataWrapperObj1.key=1;
       dataWrapperObj1.rowspan=1;
       PermissionDataWrapper dataWrapperObj2= new PermissionDataWrapper();
       dataWrapperObj2.type='Test2';
       dataWrapperObj2.key=1;
       dataWrapperObj2.rowspan=1;

       List<PermissionDataWrapper> wrapperList= new List<PermissionDataWrapper>{dataWrapperObj1};

       mocks.startStubbing();
       mocks.when(serviceMock.getAllPermissionData()).thenReturn(wrapperList);
       mocks.stopStubbing();

       PermissionApplication.Service.setMock(IPermissionService.class,serviceMock);

       test.startTest();
       List<PermissionDataWrapper>resList=PermissionController.getAllPermissionData();
       test.stopTest();

       ((IPermissionService)mocks.verify(serviceMock)).getAllPermissionData();
       System.assertEquals(resList, wrapperList);
    }

    @isTest
    private static void test_controller_getObjectOptionsForObjectPermissions_shouldReturnAllObjectPermissionOptions(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IPermissionService serviceMock = (IPermissionService)mocks.mock(PermissionServiceImpl.class);

        ObjectPermissions op1=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()),SObjectType='Test1',PermissionsCreate=true, PermissionsRead=true, PermissionsEdit=true, PermissionsDelete=true, PermissionsViewAllRecords=true, PermissionsModifyAllRecords=true);
        ObjectPermissions op2=new ObjectPermissions(Id=fflib_IDGenerator.generate(ObjectPermissions.getSObjectType()),SObjectType='Test2',PermissionsCreate=true, PermissionsRead=true, PermissionsEdit=true, PermissionsDelete=true, PermissionsViewAllRecords=true, PermissionsModifyAllRecords=true);
        List<ObjectPermissions> opList=new List<ObjectPermissions>{op1,op2};

        ComboboxDataWrapper objPermWrapper1 = new ComboboxDataWrapper( op1.SObjectType,op1.SObjectType);
        ComboboxDataWrapper objPermWrapper2 = new ComboboxDataWrapper( op2.SObjectType,op2.SObjectType);
        List<ComboboxDataWrapper> sentObjPermWrapper= new List<ComboboxDataWrapper>{objPermWrapper1,objPermWrapper2};

        mocks.startStubbing();
        mocks.when(serviceMock.getObjectOptionsForObjectPermissions()).thenReturn(sentObjPermWrapper);
        mocks.stopStubbing();

        PermissionApplication.Service.setMock(IPermissionService.class,serviceMock);
        test.startTest();
        List<ComboboxDataWrapper> result= PermissionController.getObjectOptionsForObjectPermissions();
        test.stopTest();
        ((IPermissionService)mocks.verify(serviceMock)).getObjectOptionsForObjectPermissions();
       // system.assertEquals(result, sentObjPermWrapper);

    }

    @isTest
    private static void test_controller_getObjectOptionsForFieldPermissions_shouldReturnAllFieldPermissionOptions(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IPermissionService serviceMock = (IPermissionService)mocks.mock(PermissionServiceImpl.class);

        FieldPermissions fp1 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Test1');
        FieldPermissions fp2 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Test2');
        List<FieldPermissions> fpList=new List<FieldPermissions>{fp1,fp2};
        ComboboxDataWrapper fldPermWrapper1 = new ComboboxDataWrapper( fp1.SObjectType,fp1.SObjectType);
        ComboboxDataWrapper fldPermWrapper2 = new ComboboxDataWrapper( fp2.SObjectType,fp2.SObjectType);

        List<ComboboxDataWrapper> sentFldPermWrapper= new List<ComboboxDataWrapper>{fldPermWrapper1,fldPermWrapper2};

        mocks.startStubbing();
        mocks.when(serviceMock.getObjectOptionsForFieldPermissions()).thenReturn(sentFldPermWrapper);
        mocks.stopStubbing();

        PermissionApplication.Service.setMock(IPermissionService.class,serviceMock);
        test.startTest();
        List<ComboboxDataWrapper> result= PermissionController.getObjectOptionsForFieldPermissions();
        test.stopTest();
        ((IPermissionService)mocks.verify(serviceMock)).getObjectOptionsForFieldPermissions();
        system.assertEquals(result, sentFldPermWrapper);
    }

    @isTest
    private static void test_controller_getFieldOptionsByObject_shouldReturnAllFieldNameUnderGivenObject(){
        fflib_ApexMocks mocks = new fflib_ApexMocks();
        IPermissionService serviceMock = (IPermissionService)mocks.mock(PermissionServiceImpl.class);
        FieldPermissions fp1 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Test1');
        FieldPermissions fp2 = new FieldPermissions(Id=fflib_IDGenerator.generate(FieldPermissions.getSObjectType()),SObjectType='Test2');
        List<FieldPermissions> fpList=new List<FieldPermissions>{fp1,fp2};
        ComboboxDataWrapper fldPermWrapper1 = new ComboboxDataWrapper( fp1.SObjectType,fp1.SObjectType);
        ComboboxDataWrapper fldPermWrapper2 = new ComboboxDataWrapper( fp2.SObjectType,fp2.SObjectType);

        List<ComboboxDataWrapper> sentFldPermWrapper= new List<ComboboxDataWrapper>{fldPermWrapper1,fldPermWrapper2};

        mocks.startStubbing();
        mocks.when(serviceMock.getFieldOptionsByObject('Test')).thenReturn(sentFldPermWrapper);
        mocks.stopStubbing();

        PermissionApplication.Service.setMock(IPermissionService.class,serviceMock);
        test.startTest();
        List<ComboboxDataWrapper> result= PermissionController.getFieldOptionsByObject('Test');
        test.stopTest();
        ((IPermissionService)mocks.verify(serviceMock)).getFieldOptionsByObject('Test');
        system.assertEquals(result, sentFldPermWrapper);

    }

}