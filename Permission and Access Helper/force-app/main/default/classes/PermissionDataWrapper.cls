public with sharing class PermissionDataWrapper {

    @AuraEnabled
    public String type;
    @AuraEnabled
    public List<PermissionSetProfileData> permissionSetProfileData;
    @AuraEnabled
    public Integer rowspan;
    

    public class PermissionSetProfileData{
        @AuraEnabled
        public String name;
        @AuraEnabled
        public List<PermissionTypeData> permissionTypeData;
        @AuraEnabled
        public Integer rowspan;
    }

    public class PermissionTypeData{
        @AuraEnabled
        public String permissionType;
        @AuraEnabled
        public List<Permission> permissions;
        @AuraEnabled
        public Integer rowspan;
        
        public PermissionTypeData(String permissionType, List<Permission> permissions, Integer rowspan){
            this.permissionType = permissionType;
            this.permissions = permissions;
            this.rowspan = rowspan;
        }
    }

    public class Permission{
        @AuraEnabled
        public String value;
        @AuraEnabled
        public String access;

        public Permission(String value, String access){
            this.value = value;
            this.access = access;
        }
    }
}