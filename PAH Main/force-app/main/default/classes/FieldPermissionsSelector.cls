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
    public static List<FieldPermissions> getFieldPermissions(Id PermissionSetId, String ObjName){
        return[SELECT Id, 
               ParentId, 
               SobjectType,
               Field,
               PermissionsEdit,
               PermissionsRead
               FROM FieldPermissions 
               WHERE ParentId=:PermissionSetId
              AND SobjectType=:ObjName];
    }
}