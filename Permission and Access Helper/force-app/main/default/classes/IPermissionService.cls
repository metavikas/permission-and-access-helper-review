/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public interface IPermissionService {
    List<ComboboxDataWrapper> getProfiles();
    List<ComboboxDataWrapper> getPermissionSets();
    List<PermissionDataWrapper> getAllPermissionData();
    List<ComboboxDataWrapper> getObjectOptionsForObjectPermissions();
    List<ComboboxDataWrapper> getObjectOptionsForFieldPermissions();
    List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName);
}
