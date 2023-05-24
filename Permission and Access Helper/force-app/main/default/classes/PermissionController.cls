/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */


public class PermissionController {
        class CustomException extends Exception{}
    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getProfiles() {
        try {
            return PermissionService.getProfiles();
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getPermissionSets() {
        try {
            return PermissionService.getPermissionSets();
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<PermissionDataWrapper> getAllPermissionData() {
        try {
            return PermissionService.getAllPermissionData();
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getObjectOptionsForObjectPermissions() {
        try {
            return PermissionService.getObjectOptionsForObjectPermissions();
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getObjectOptionsForFieldPermissions() {
        try {
            return PermissionService.getObjectOptionsForFieldPermissions();
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ComboboxDataWrapper> getFieldOptionsByObject(String objectName) {
        try {
            return PermissionService.getFieldOptionsByObject(objectName);
        } catch (Exception e) {
            throw new CustomException(e.getMessage());
        }
    }
}








