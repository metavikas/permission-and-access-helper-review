public with sharing class PermissionService {
    
    public static List<ComboboxDataWrapper> getProfile(){
        return service().getProfile();
    }
    public static List<ComboboxDataWrapper> getPermissionSet(){
        return service().getPermissionSet();
    }
    public static List<PermissionDataWrapper> getAllPermissionData(){
        return service().getAllPermissionData();
    }
    private static IPermissionService service()
    {
        return (IPermissionService) PermissionApplication.Service.newInstance(IPermissionService.class);
    }   
}