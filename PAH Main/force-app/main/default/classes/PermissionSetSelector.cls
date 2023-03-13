public class PermissionSetSelector {
    public List<PermissionSet> getPermissionSets(){
        return [SELECT Id, Name,Label, ProfileId FROM PermissionSet];
    }
}