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
    public static List<ComboboxDataWrapper> getOjbectOptionsForObjectPermissions(){
        return service().getOjbectOptionsForObjectPermissions();
    }
    public static List<ComboboxDataWrapper> getOjbectOptionsForFieldPermissions(){
        return service().getOjbectOptionsForFieldPermissions();
    }
    public static List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName){
        return service().getFieldOptionsByObject(objectName);
    }
    private static IPermissionService service()
    {
        return (IPermissionService) PermissionApplication.Service.newInstance(IPermissionService.class);
    }   
}