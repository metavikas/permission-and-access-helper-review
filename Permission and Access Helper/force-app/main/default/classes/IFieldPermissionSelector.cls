/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public interface IFieldPermissionSelector extends fflib_ISObjectSelector {
    List<FieldPermissions> getAllRecords();
    List<FieldPermissions> getRecordsByObject(String objectName);
}
