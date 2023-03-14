public interface IPermissionService {
    List<ComboboxDataWrapper> getProfile();
    List<ComboboxDataWrapper> getPermissionSet();
    List<PermissionDataWrapper> getFieldPermissionsByPermissionSet(Id PermissionSetId, String ObjName);
    List<PermissionDataWrapper> getFieldPermissionsByProfile(Id ProfileId, String ObjName);
    List<PermissionDataWrapper> getObjectPermissionsByProfile(Id ProfileId);
    List<PermissionDataWrapper> getObjectPermissionsByPermissionSet(Id PermissionSetId);
}