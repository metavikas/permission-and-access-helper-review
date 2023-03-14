public class FieldPermissionsSelector extends fflib_SObjectSelector implements IFieldPermissionSelector {
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
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
    public static IFieldPermissionSelector newInstance()
    {
        return (IFieldPermissionSelector) PermissionApplication.Selector.newInstance(FieldPermissions.getSObjectType());
    }
    public List<FieldPermissions> getFieldPermissionsByPermissionSet(Id PermissionSetId, String ObjName){
        return (List<FieldPermissions>) Database.query(
         newQueryFactory()
        .setCondition('ParentId =:PermissionSetId AND SobjectType=:ObjName')
        .toSOQL());
    }
    
    public List<FieldPermissions> getFieldPermissionsByProfile(Id ProfileId, String ObjName){
       return (List<FieldPermissions>) Database.query(
         newQueryFactory()
        .setCondition('Parent.ProfileId =:ProfileId AND SObjectType=: ObjName')
        .toSOQL());
    }
}

