public with sharing class PermissionApplication {
   // Configure and create the UnitOfWorkFactory for this Application
	// public static final fflib_Application.UnitOfWorkFactory UnitOfWork =
    // new fflib_Application.UnitOfWorkFactory(
    //         new List<SObjectType> {
    //             PurchaseOrder__c.SObjectType,
    //             Product2.SObjectType,
    //             PurchaseOrderLineItems__c.SObjectType });	

// Configure and create the ServiceFactory for this Application
public static final fflib_Application.ServiceFactory Service =
    new fflib_Application.ServiceFactory(
        new Map<Type, Type> {
                IPermissionService.class => PermissionServiceImpl.class});

// Configure and create the SelectorFactory for this Application
public static final fflib_Application.SelectorFactory Selector =
    new fflib_Application.SelectorFactory(
        new Map<SObjectType, Type> {
                Profile.SObjectType => ProfileSelector.class,
                PermissionSet.SObjectType => PermissionSetSelector.class,
                ObjectPermissions.getSObjectType()=>ObjectPermissionSelector.class,
                FieldPermissions.getSObjectType()=>FieldPermissionsSelector.class
                 });

}
