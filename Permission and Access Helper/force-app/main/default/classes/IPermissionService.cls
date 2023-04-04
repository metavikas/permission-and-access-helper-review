public interface IPermissionService {
    List<ComboboxDataWrapper> getProfile();
    List<ComboboxDataWrapper> getPermissionSet();
    List<PermissionDataWrapper> getAllPermissionData();
    List<ComboboxDataWrapper> getOjbectOptionsForObjectPermissions();
    List<ComboboxDataWrapper> getOjbectOptionsForFieldPermissions();
    List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName);
}