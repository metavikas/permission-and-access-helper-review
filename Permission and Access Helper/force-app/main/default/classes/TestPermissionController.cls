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

        mocks.when(serviceMock.getProfile()).thenReturn(profileList);
        ComboboxDataWrapper forCheck1 = new ComboboxDataWrapper(p1.Name, p1.Id);
        ComboboxDataWrapper forCheck2 = new ComboboxDataWrapper(p2.Name, p2.Id);
        List<ComboboxDataWrapper> forCheck = new List<ComboboxDataWrapper>{forCheck1,forCheck2};
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

        mocks.when(serviceMock.getPermissionSet()).thenReturn(permissionSetList);
        ComboboxDataWrapper forCheck1 = new ComboboxDataWrapper(p1.label, p1.Id);
        ComboboxDataWrapper forCheck2 = new ComboboxDataWrapper(p2.label, p2.Id);
        List<ComboboxDataWrapper> forCheck = new List<ComboboxDataWrapper>{forCheck1,forCheck2};
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

}