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
    public static List<PermissionDataWrapper> getObjectPermissionsByProfile(Id profileId){
        return PermissionService.getObjectPermissionsByProfile(profileId);
    }
    
    @AuraEnabled(cacheable=true)
    public static List<PermissionDataWrapper> getObjectPermissionsByPermissionSet(Id permissionSetId){
        return PermissionService.getObjectPermissionsByPermissionSet(permissionSetId);
    }
    
    @AuraEnabled(cacheable=true)
    public static List<PermissionDataWrapper> getFieldPermissionsByPermissionSet(Id permissionSetId, String objName){
        return PermissionService.getFieldPermissionsByPermissionSet( permissionSetId, objName);
    }
    
    @AuraEnabled(cacheable=true)
    public static List<PermissionDataWrapper>getFieldPermissionsByProfile(Id profileId, String objName){
        return PermissionService.getFieldPermissionsByProfile( profileId, objName);
    }
    
    
}