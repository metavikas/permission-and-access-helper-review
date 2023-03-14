public class PermissionSetSelector extends fflib_SObjectSelector implements IPermissionSetSelector {
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
                PermissionSet.Id,
                PermissionSet.Name,
                PermissionSet.Label};
    }
    
    public Schema.SObjectType getSObjectType() {
        return PermissionSet.sObjectType;
    }
    
    public List<PermissionSet> getPermissionSet(){
            return(List<PermissionSet>) Database.query(
            newQueryFactory()
            .toSOQL());
    }
    public static IPermissionSetSelector newInstance()
    {
        return (IPermissionSetSelector) PermissionApplication.Selector.newInstance(PermissionSet.SObjectType);
    }
    
}