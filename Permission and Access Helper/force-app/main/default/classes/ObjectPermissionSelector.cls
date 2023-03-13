public class ObjectPermissionSelector extends fflib_SObjectSelector implements IObjectPermissionSelector {
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            ObjectPermissions.ID,
            ObjectPermissions.SobjectType,
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

    public static IObjectPermissionSelector newInstance()
    {
        return (IObjectPermissionSelector) PermissionApplication.Selector.newInstance(ObjectPermissions.getSObjectType());
    }

    public List<ObjectPermissions> getObjectPermissionsByPermissionSet(Id PermissionSetId){
         return (List<ObjectPermissions>) Database.query(
        newQueryFactory()
        .setCondition('ParentId =:PermissionSetId')
        .toSOQL());
    }
    
    public List<ObjectPermissions> getObjectPermissionsByProfile(Id ProfileId){
        return (List<ObjectPermissions>) Database.query(
        newQueryFactory()
        .setCondition('Parent.ProfileId=:ProfileId')
        .toSOQL());
    }
}