public with sharing class PermissionApplication {
    
    public static final fflib_Application.ServiceFactory Service =
        new fflib_Application.ServiceFactory(
            new Map<Type, Type> {
                IPermissionService.class => PermissionServiceImpl.class});
    
    public static final fflib_Application.SelectorFactory Selector =
        new fflib_Application.SelectorFactory(
            new Map<SObjectType, Type> {
                Profile.SObjectType => ProfileSelector.class,
                    PermissionSet.SObjectType => PermissionSetSelector.class,
                    ObjectPermissions.getSObjectType()=>ObjectPermissionSelector.class,
                    FieldPermissions.getSObjectType()=>FieldPermissionsSelector.class
                    });
    
}