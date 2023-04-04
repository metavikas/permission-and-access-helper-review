public class PermissionController {
    
    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getProfile(){
        return PermissionService.getProfile();
    }
    
    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getPermissionSet(){
        return PermissionService.getPermissionSet();
    }
    
    @AuraEnabled(cacheable=true)
    public static List<PermissionDataWrapper> getAllPermissionData(){
        return PermissionService.getAllPermissionData();
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getOjbectOptionsForObjectPermissions(){
        return PermissionService.getOjbectOptionsForObjectPermissions();
    }
    
    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getOjbectOptionsForFieldPermissions(){
        return PermissionService.getOjbectOptionsForFieldPermissions();
    } 

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName){
        return PermissionService.getFieldOptionsByObject(objectName);
    }
    
}