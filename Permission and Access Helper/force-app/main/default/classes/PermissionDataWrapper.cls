public with sharing class PermissionDataWrapper {

    @AuraEnabled
    public String type;
    @AuraEnabled
    public Integer key;
    @AuraEnabled
    public List<PermissionSetProfileData> permissionSetProfileData;
    @AuraEnabled
    public Integer rowspan;
    

    public class PermissionSetProfileData{
        @AuraEnabled
        public String name;
        @AuraEnabled
        public String id;
        @AuraEnabled
        public Integer key;
        @AuraEnabled
        public List<PermissionTypeData> permissionTypeData;
        @AuraEnabled
        public Integer rowspan;
    }

    public class PermissionTypeData{
        @AuraEnabled
        public String permissionType;
        @AuraEnabled
        public Integer key;
        @AuraEnabled
        public List<Permission> permissions;
        @AuraEnabled
        public Integer rowspan;
        
        public PermissionTypeData(String permissionType, List<Permission> permissions, Integer rowspan, Integer key){
            this.permissionType = permissionType;
            this.permissions = permissions;
            this.rowspan = rowspan;
            this.key = key;
        }
    }

    public class Permission{
        @AuraEnabled
        public String value;
        @AuraEnabled
        public Integer key;
        @AuraEnabled
        public String access;

        public Permission(String value, String access, Integer key){
            this.value = value;
            this.access = access;
            this.key = key;
        }
    }
}