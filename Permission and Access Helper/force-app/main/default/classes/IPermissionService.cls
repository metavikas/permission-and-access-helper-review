public interface IPermissionService {
    List<ComboboxDataWrapper> getProfile();
    List<ComboboxDataWrapper> getPermissionSet();
    List<PermissionDataWrapper> getAllPermissionData();
}