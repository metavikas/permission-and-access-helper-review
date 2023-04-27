/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public without sharing class FieldPermissionsSelector extends fflib_SObjectSelector implements IFieldPermissionSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
            FieldPermissions.ID,
            FieldPermissions.ParentId,
            FieldPermissions.SobjectType,
            FieldPermissions.Field,
            FieldPermissions.PermissionsEdit,
            FieldPermissions.PermissionsRead
        };
    }
    public Schema.SObjectType getSObjectType() {
        return FieldPermissions.getSObjectType();
    }
    public static IFieldPermissionSelector newInstance() {
        return (IFieldPermissionSelector) PermissionApplication.Selector.newInstance(FieldPermissions.getSObjectType());
    }
    public List<FieldPermissions> getAllRecords() {
        return (List<FieldPermissions>) Database.query(
            newQueryFactory().selectFields(new List<String>{ 'Parent.ProfileId', 'Parent.IsOwnedByProfile' }).toSOQL()
        );
    }
    public List<FieldPermissions> getRecordsByObject(String objectName) {
        return (List<FieldPermissions>) Database.query(newQueryFactory().setCondition('SobjectType = :objectName').toSOQL());
    }
}
