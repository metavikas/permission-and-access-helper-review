public with sharing class PermissionService {
    
    public static List<ComboboxDataWrapper> getProfile(){
        return service().getProfile();
    }
    public static List<ComboboxDataWrapper> getPermissionSet(){
        return service().getPermissionSet();
    }
    public static List<PermissionDataWrapper> getObjectPermissionsByProfile(Id ProfileId){
        return service().getObjectPermissionsByProfile(ProfileId);
    }
    public static List<PermissionDataWrapper> getObjectPermissionsByPermissionSet(Id PermissionSetId){
        return service().getObjectPermissionsByPermissionSet(PermissionSetId);
    }
    public static List<PermissionDataWrapper> getFieldPermissionsByPermissionSet(Id PermissionSetId, String ObjName){
        return service().getFieldPermissionsByPermissionSet( PermissionSetId, ObjName);
    }
    public static List<PermissionDataWrapper> getFieldPermissionsByProfile(Id ProfileId, String ObjName){
        return service().getFieldPermissionsByProfile( ProfileId, ObjName);
    }
    private static IPermissionService service()
    {
        return (IPermissionService) PermissionApplication.Service.newInstance(IPermissionService.class);
    }   
}