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
    public static List<ComboboxDataWrapper> getObjectOptionsForObjectPermissions(){
        return PermissionService.getObjectOptionsForObjectPermissions();
    }
    
    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getObjectOptionsForFieldPermissions(){
        return PermissionService.getObjectOptionsForFieldPermissions();
    } 

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName){
        return PermissionService.getFieldOptionsByObject(objectName);
    }
    
}