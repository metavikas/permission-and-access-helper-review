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
    public static List<ComboboxDataWrapper> getObjectOptionsForObjectPermissions(){
        return service().getObjectOptionsForObjectPermissions();
    }
    public static List<ComboboxDataWrapper> getObjectOptionsForFieldPermissions(){
        return service().getObjectOptionsForFieldPermissions();
    }
    public static List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName){
        return service().getFieldOptionsByObject(objectName);
    }
    private static IPermissionService service()
    {
        return (IPermissionService) PermissionApplication.Service.newInstance(IPermissionService.class);
    }   
}