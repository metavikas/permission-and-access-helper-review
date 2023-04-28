/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public without sharing class ObjectPermissionSelector extends fflib_SObjectSelector implements IObjectPermissionSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
            ObjectPermissions.ID,
            ObjectPermissions.SobjectType,
            ObjectPermissions.ParentId,
            ObjectPermissions.PermissionsCreate,
            ObjectPermissions.PermissionsRead,
            ObjectPermissions.PermissionsEdit,
            ObjectPermissions.PermissionsDelete,
            ObjectPermissions.PermissionsViewAllRecords,
            ObjectPermissions.PermissionsModifyAllRecords
        };
    }
    public Schema.SObjectType getSObjectType() {
        return ObjectPermissions.getSObjectType();
    }

    public static IObjectPermissionSelector newInstance() {
        return (IObjectPermissionSelector) PermissionApplication.Selector.newInstance(ObjectPermissions.getSObjectType());
    }

    public List<ObjectPermissions> getAllRecords() {
        return (List<ObjectPermissions>) Database.query(
            newQueryFactory().selectFields(new List<String>{ 'Parent.ProfileId', 'Parent.IsOwnedByProfile' }).toSOQL()
        );
    }
}
