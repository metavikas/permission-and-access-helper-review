public with sharing class PermissionServiceImpl implements IPermissionService{
    
 	public List<ComboboxDataWrapper> getProfile(){
        return convertProfilesToWrapper(ProfileSelector.newInstance().getProfile());
 	}
 	public List<ComboboxDataWrapper> getPermissionSet(){
        return convertPermissionSetsToWrapper(PermissionSetSelector.newInstance().getPermissionSet());
 	}
    public List<PermissionDataWrapper> getObjectPermissionsByProfile(Id ProfileId){
        return convertObjectPermissionsToWrapper(ObjectPermissionSelector.newInstance().getObjectPermissionsByProfile(ProfileId));
    }
    public List<PermissionDataWrapper> getObjectPermissionsByPermissionSet(Id PermissionSetId){
        return convertObjectPermissionsToWrapper(ObjectPermissionSelector.newInstance().getObjectPermissionsByPermissionSet(PermissionSetId));
    }
    public List<PermissionDataWrapper> getFieldPermissionsByPermissionSet(Id PermissionSetId, String ObjName){
        return convertFieldPermissionsToWrapper(FieldPermissionsSelector.newInstance().getFieldPermissionsByPermissionSet( PermissionSetId, ObjName));
    }
    public List<PermissionDataWrapper> getFieldPermissionsByProfile(Id ProfileId, String ObjName){
        return convertFieldPermissionsToWrapper(FieldPermissionsSelector.newInstance().getFieldPermissionsByProfile( ProfileId, ObjName));
    }
    
    private List<PermissionDataWrapper> convertObjectPermissionsToWrapper(List<ObjectPermissions> objectPermissions){
        if(objectPermissions.size() == 0){
            return null;
        }
        List<PermissionDataWrapper> wrappedData = new List<PermissionDataWrapper>();
        Map<String, SObjectType> objectMap = Schema.getGlobalDescribe();
        for(ObjectPermissions obj : objectPermissions){
            Map<String, Boolean> permissions = new Map<String,Boolean>();
            permissions.put('Create', obj.PermissionsCreate);
            permissions.put('Read', obj.PermissionsRead);
            permissions.put('Edit', obj.PermissionsEdit);
            permissions.put('Delete', obj.PermissionsDelete);
            permissions.put('ViewAllRecords', obj.PermissionsViewAllRecords);
            permissions.put('ModifyAllRecords', obj.PermissionsModifyAllRecords);
            String label = '';
            SObjectType objectInUse = objectMap.get(obj.SobjectType);
            if(objectInUse == null){
                label = obj.SobjectType;
                System.debug('Null occured ' + label);
            }else{
                label = objectInUse.getDescribe().getLabel();
            }
            wrappedData.add(new PermissionDataWrapper(label,
                                                        obj.SobjectType,
                                                        obj.Id,
                                                        permissions));
        }
        return wrappedData;
    } 
    private List<PermissionDataWrapper> convertFieldPermissionsToWrapper(List<FieldPermissions> fieldPermissions){
        if(fieldPermissions.size() == 0){
            return null;
        }
        List<PermissionDataWrapper> wrappedData = new List<PermissionDataWrapper>();
        String objectName = fieldPermissions[0].SobjectType;
        List<Schema.DescribeSObjectResult> describeData = Schema.describeSObjects(
            new List<String>{ objectName },
            SObjectDescribeOptions.DEFERRED
        );
        Map<String, Schema.SObjectField> fieldMap =  describeData[0].fields.getMap();
        for(FieldPermissions fpData : fieldPermissions){
            Map<String, Boolean> permissions = new Map<String,Boolean>();
            permissions.put('Edit', fpData.PermissionsEdit);
            permissions.put('Read', fpData.PermissionsRead);
            String fieldName = fpData.Field.split('\\.')[1];
            Schema.DescribeFieldResult fieldResult = fieldMap.get(fieldName).getDescribe();
            wrappedData.add(new PermissionDataWrapper(fieldResult.getLabel(),
                                                        fieldName,
                                                        fpData.Id,
                                                        permissions));
        }
        return wrappedData;
    } 
    private List<ComboboxDataWrapper> convertPermissionSetsToWrapper(List<PermissionSet> permissionSets){
        List<ComboboxDataWrapper> wrappedData = new List<ComboboxDataWrapper>();
        for(PermissionSet ps : permissionSets){
            wrappedData.add(new ComboboxDataWrapper(ps.Name, ps.Id));
        }
        return wrappedData;
    }
    private List<ComboboxDataWrapper> convertProfilesToWrapper(List<Profile> profiles){
        List<ComboboxDataWrapper> wrappedData = new List<ComboboxDataWrapper>();
        for(Profile prof : profiles){
            wrappedData.add(new ComboboxDataWrapper(prof.Name, prof.Id));
        }
        return wrappedData;
    }
}