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
    
}