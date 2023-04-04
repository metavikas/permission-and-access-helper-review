@isTest
public with sharing class PermissionAndAccessHelperMockTest {
    @isTest
   private static void callingServiceShouldCallProfileSelectors(){

    fflib_ApexMocks mocks = new fflib_ApexMocks();
    IProfileSelector mockProfileSelector = new Mocks.ProfileSelector(mocks);

    

    mocks.startStubbing();
    Profile p1 = new Profile(Id=fflib_IDGenerator.generate(Profile.SObjectType),
    Name='Test');
    Profile p2 = new Profile(Id=fflib_IDGenerator.generate(Profile.SObjectType),
    Name='Test');

    List<Profile>resProfileList=new List<Profile>{p1,p2};
    mocks.when(mockProfileSelector.getProfile()).thenReturn(resProfileList);
    
    mocks.stopStubbing();

    PermissionApplication.Selector.setMock(mockProfileSelector);

    Test.startTest();
    List<ComboboxDataWrapper> obtainedProfiles =PermissionService.getProfile();
    System.debug(obtainedProfiles);
    Test.stopTest();

    ((IProfileSelector) mocks.verify(mockProfileSelector,1)).getProfile();
		//System.assertEquals(resProfileList, obtainedProfiles);
   }

//    @isTest
//    public static void callingServiceShouldCallPermissionSetSelectors(){
//     fflib_ApexMocks mocks = new fflib_ApexMocks();
//     IPermissionSetSelector mockPermissionSelector = new Mocks.PermissionSetSelector(mocks);
//     PermissionSet perm1= new PermissionSet(Id=fflib_IDGenerator.generate(PermissionSet.SObjectType),
//     Name='abc');
//     PermissionSet perm2= new PermissionSet(Id=fflib_IDGenerator.generate(PermissionSet.SObjectType),
//     Name='def');
//     List<PermissionSet>resPermissionSets=new List<PermissionSet>{perm1,perm2};
//     mocks.startStubbing();
//     mocks.when(mockPermissionSelector.getPermissionSet()).thenReturn(resPermissionSets);
//     PermissionApplication.Selector.setMock(mockPermissionSelector);
//     mocks.stopStubbing();
//     Test.startTest();
//     List<ComboboxDataWrapper>obtainedPermissionSets=PermissionService.getPermissionSet();
//     Test.stopTest();

//     ((IPermissionSetSelector) mocks.verify(mockPermissionSelector,1)).getPermissionSet();
// 		// System.assertEquals(resPermissionSets,obtainedPermissionSets);
//    }
}
