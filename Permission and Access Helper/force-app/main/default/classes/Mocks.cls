@isTest
public  class Mocks {

   public class ProfileSelector extends fflib_SObjectMocks.SObjectSelector implements IProfileSelector{
      
    private fflib_ApexMocks mocks;
     public ProfileSelector(fflib_ApexMocks mocks){
        super(mocks);
        this.mocks=mocks;
     }
     public List<Profile> getProfile(){
        return (List<Profile>) mocks.mockNonVoidMethod(this, 'getProfile', new List<Type> {}, new List<Object> {});
     }
   }

   public class PermissionSetSelector extends fflib_SObjectMocks.SObjectSelector implements IPermissionSetSelector{
      
    private fflib_ApexMocks mocks;
     public PermissionSetSelector(fflib_ApexMocks mocks){
        super(mocks);
        this.mocks=mocks;
     }
     public List<PermissionSet> getPermissionSet(){
        return (List<PermissionSet>) mocks.mockNonVoidMethod(this, 'getPermissionSet', new List<Type> {}, new List<Object> {});
     }
   }
}