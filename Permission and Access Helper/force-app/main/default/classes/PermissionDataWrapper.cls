public with sharing class PermissionDataWrapper {
    
    @AuraEnabled
    public String label;
    @AuraEnabled
    public String apiName;
    @AuraEnabled
    public String Id;
    @AuraEnabled
    public Map<String, Boolean> permissions;
    
    public PermissionDataWrapper(String label, String apiName, String Id, Map<String, Boolean> permissions) {
        this.label = label;
        this.apiName = apiName;
        this.Id = Id;
        this.permissions = permissions;
    }
}