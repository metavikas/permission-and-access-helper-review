public interface IPermissionService {
    List<ComboboxDataWrapper> getProfile();
    List<ComboboxDataWrapper> getPermissionSet();
    List<PermissionDataWrapper> getAllPermissionData();
    List<ComboboxDataWrapper> getObjectOptionsForObjectPermissions();
    List<ComboboxDataWrapper> getObjectOptionsForFieldPermissions();
    List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName);
}