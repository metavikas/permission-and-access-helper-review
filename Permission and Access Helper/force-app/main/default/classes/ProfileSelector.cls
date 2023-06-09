public class ProfileSelector extends fflib_SObjectSelector implements IProfileSelector {
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Profile.Id,
            Profile.Name};
    }
    
    public Schema.SObjectType getSObjectType() {
        return Profile.sObjectType;
    }
    
    public override String getOrderBy() {
        return 'Name ASC';
    }

    public List<Profile> getAllRecords(){
        return(List<Profile>) Database.query(
            newQueryFactory()
            .toSOQL());
    }

    public static IProfileSelector newInstance()
    {
        return (IProfileSelector) PermissionApplication.Selector.newInstance(Profile.SObjectType);
    }
    
}