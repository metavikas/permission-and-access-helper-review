/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public without sharing class PermissionSetSelector extends fflib_SObjectSelector implements IPermissionSetSelector {
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{ PermissionSet.Id, PermissionSet.Name, PermissionSet.Label };
    }

    public Schema.SObjectType getSObjectType() {
        return PermissionSet.sObjectType;
    }

    public override String getOrderBy() {
        return 'Label ASC';
    }

    public List<PermissionSet> getAllRecords() {
        return (List<PermissionSet>) Database.query(newQueryFactory().setCondition('IsOwnedByProfile = false').toSOQL());
    }
    public static IPermissionSetSelector newInstance() {
        return (IPermissionSetSelector) PermissionApplication.Selector.newInstance(PermissionSet.SObjectType);
    }
}
