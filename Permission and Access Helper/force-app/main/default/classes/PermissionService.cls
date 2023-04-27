/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public class PermissionService {
    public static List<ComboboxDataWrapper> getProfiles() {
        return service().getProfiles();
    }
    public static List<ComboboxDataWrapper> getPermissionSets() {
        return service().getPermissionSets();
    }
    public static List<PermissionDataWrapper> getAllPermissionData() {
        return service().getAllPermissionData();
    }
    public static List<ComboboxDataWrapper> getObjectOptionsForObjectPermissions() {
        return service().getObjectOptionsForObjectPermissions();
    }
    public static List<ComboboxDataWrapper> getObjectOptionsForFieldPermissions() {
        return service().getObjectOptionsForFieldPermissions();
    }
    public static List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName) {
        return service().getFieldOptionsByObject(objectName);
    }
    private static IPermissionService service() {
        return (IPermissionService) PermissionApplication.Service.newInstance(IPermissionService.class);
    }
}
