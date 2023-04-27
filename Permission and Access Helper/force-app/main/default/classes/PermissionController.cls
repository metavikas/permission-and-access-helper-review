/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public class PermissionController {
    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getProfiles() {
        try {
            return PermissionService.getProfiles();
        } catch (DmlException e) {
            throw new AuraHandledException('The following exception has occurred: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getPermissionSets() {
        try {
            return PermissionService.getPermissionSets();
        } catch (DmlException e) {
            throw new AuraHandledException('The following exception has occurred: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<PermissionDataWrapper> getAllPermissionData() {
        try {
            return PermissionService.getAllPermissionData();
        } catch (DmlException e) {
            throw new AuraHandledException('The following exception has occurred: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getObjectOptionsForObjectPermissions() {
        try {
            return PermissionService.getObjectOptionsForObjectPermissions();
        } catch (DmlException e) {
            throw new AuraHandledException('The following exception has occurred: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getObjectOptionsForFieldPermissions() {
        try {
            return PermissionService.getObjectOptionsForFieldPermissions();
        } catch (DmlException e) {
            throw new AuraHandledException('The following exception has occurred: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName) {
        try {
            return PermissionService.getFieldOptionsByObject(objectName);
        } catch (DmlException e) {
            throw new AuraHandledException('The following exception has occurred: ' + e.getMessage());
        }
    }
}
