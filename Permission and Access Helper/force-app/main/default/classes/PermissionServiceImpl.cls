public with sharing class PermissionServiceImpl implements IPermissionService{
    
 	public List<ComboboxDataWrapper> getProfile(){
        return convertProfilesToWrapper(ProfileSelector.newInstance().getProfile());
 	}
 	public List<ComboboxDataWrapper> getPermissionSet(){
        return convertPermissionSetsToWrapper(PermissionSetSelector.newInstance().getPermissionSet());
 	}
    public static List<PermissionDataWrapper> getAllPermissionData(){
        List<FieldPermissions> fieldPermissions = FieldPermissionsSelector.newInstance().getAllRecords();
        List<ObjectPermissions> objectPermissions = ObjectPermissionSelector.newInstance().getAllRecords();
        List<PermissionSet> permissionSets = PermissionSetSelector.newInstance().getPermissionSet();
        List<Profile> profiles = ProfileSelector.newInstance().getProfile();
        List<PermissionDataWrapper> dataToReturn = convertAllDataToWrapper(fieldPermissions, objectPermissions, permissionSets, profiles);
        return dataToReturn;
    }
    
    private static List<PermissionDataWrapper> convertAllDataToWrapper(List<FieldPermissions> fieldPermissions, List<ObjectPermissions> objectPermissions, List<PermissionSet> permissionSets, List<Profile> profiles){
        if(fieldPermissions.isEmpty() && objectPermissions.isEmpty()){
            return new List<PermissionDataWrapper>();
        }
        
        List<PermissionDataWrapper> wrappedData = new List<PermissionDataWrapper>();
        Map<String, List<ObjectPermissions>> objectPermissionByProfile= new Map<String, List<ObjectPermissions>>();
        Map<String, List<ObjectPermissions>> objectPermissionByPermissionSet = new Map<String, List<ObjectPermissions>>();
        for(ObjectPermissions opData : objectPermissions){
            if(opData.Parent.IsOwnedByProfile){
                if(objectPermissionByProfile.containsKey(opData.Parent.ProfileId)){
                    List<ObjectPermissions> nameList = objectPermissionByProfile.get(opData.Parent.ProfileId);
                    nameList.add(opData);
                    objectPermissionByProfile.put(opData.Parent.ProfileId, nameList);
                }else{
                    objectPermissionByProfile.put(opData.Parent.ProfileId, new List<ObjectPermissions> {opData});
                }
            }else{
                if(objectPermissionByPermissionSet.containsKey(opData.ParentId)){
                    List<ObjectPermissions> nameList = objectPermissionByPermissionSet.get(opData.ParentId);
                    nameList.add(opData);
                    objectPermissionByPermissionSet.put(opData.ParentId, nameList);
                }else{
                    objectPermissionByPermissionSet.put(opData.ParentId, new List<ObjectPermissions> {opData});
                }
            }
        }
        Map<String, List<FieldPermissions>> fieldPermissionByProfile= new Map<String, List<FieldPermissions>>();
        Map<String, List<FieldPermissions>> fieldPermissionByPermissionSet = new Map<String, List<FieldPermissions>>(); 
        for(FieldPermissions fpData : fieldPermissions){
            if(fpData.Parent.IsOwnedByProfile){
                if(fieldPermissionByProfile.containsKey(fpData.Parent.ProfileId)){
                    List<FieldPermissions> nameList = fieldPermissionByProfile.get(fpData.Parent.ProfileId);
                    nameList.add(fpData);
                    fieldPermissionByProfile.put(fpData.Parent.ProfileId, nameList);
                }else{
                    fieldPermissionByProfile.put(fpData.Parent.ProfileId, new List<FieldPermissions> {fpData});
                }
            }else{
                if(fieldPermissionByPermissionSet.containsKey(fpData.ParentId)){
                    List<FieldPermissions> nameList = fieldPermissionByPermissionSet.get(fpData.ParentId);
                    nameList.add(fpData);
                    fieldPermissionByPermissionSet.put(fpData.ParentId, nameList);
                }else{
                    fieldPermissionByPermissionSet.put(fpData.ParentId, new List<FieldPermissions> {fpData});
                }
            }
        }
        if(objectPermissionByProfile.size() != 0 || fieldPermissionByProfile.size() != 0){
            PermissionDataWrapper pdw = new PermissionDataWrapper();
            pdw.type = 'Profile';
            Integer pdwRowspan = 0;
            List<PermissionDataWrapper.PermissionSetProfileData> pspdList = new List<PermissionDataWrapper.PermissionSetProfileData>();
            for(Profile profile : profiles){
                List<ObjectPermissions> opList = objectPermissionByProfile.get(profile.Id);
                List<FieldPermissions> fpList = fieldPermissionByProfile.get(profile.Id);
                if((opList != null && opList.size() != 0) || (fpList != null && fpList.size() != 0)){
                    PermissionDataWrapper.PermissionSetProfileData pspd = new PermissionDataWrapper.PermissionSetProfileData();
                    pspd.name = profile.Name;
                    Integer pspdRowspan = 0;
                    List<PermissionDataWrapper.Permission> permissions = new List<PermissionDataWrapper.Permission>();
                    List<PermissionDataWrapper.PermissionTypeData> ptdList = new List<PermissionDataWrapper.PermissionTypeData>();
                    if(opList != null && opList.size() != 0){
                        for(ObjectPermissions opData : opList){
                            permissions.add(getPermissionObject(opData));
                            pspdRowspan += 1;
                            pdwRowspan += 1;
                        }
                        ptdList.add( new PermissionDataWrapper.PermissionTypeData('Object Permissions', permissions, permissions.size()));
                    }
                    permissions = new List<PermissionDataWrapper.Permission>();
                    if(fpList != null && fpList.size() != 0){
                        for(FieldPermissions fpData : fpList){
                            permissions.add(getPermissionObject(fpData));
                            pspdRowspan += 1;
                            pdwRowspan += 1;
                        }
                        ptdList.add( new PermissionDataWrapper.PermissionTypeData('Field Permissions', permissions, permissions.size()));
                    }
                    pspd.permissionTypeData = ptdList;
                    pspd.rowspan = pspdRowspan;
                    pspdList.add(pspd);
                }
            }
            pdw.permissionSetProfileData = pspdList;
            pdw.rowspan = pdwRowspan; 
            wrappedData.add(pdw);
        }
        if(objectPermissionByPermissionSet.size() != 0 || fieldPermissionByPermissionSet.size() != 0){
            PermissionDataWrapper pdw = new PermissionDataWrapper();
            pdw.type = 'Permission Set';
            Integer pdwRowspan = 0;
            List<PermissionDataWrapper.PermissionSetProfileData> pspdList = new List<PermissionDataWrapper.PermissionSetProfileData>();
            for(PermissionSet permissionSet : permissionSets){
                List<ObjectPermissions> opList = objectPermissionByPermissionSet.get(permissionSet.Id);
                List<FieldPermissions> fpList = fieldPermissionByPermissionSet.get(permissionSet.Id);
                if((opList != null && opList.size() != 0) || (fpList != null && fpList.size() != 0)){
                    PermissionDataWrapper.PermissionSetProfileData pspd = new PermissionDataWrapper.PermissionSetProfileData();
                    pspd.name = permissionSet.Name;
                    Integer pspdRowspan = 0;
                    List<PermissionDataWrapper.Permission> permissions = new List<PermissionDataWrapper.Permission>();
                    List<PermissionDataWrapper.PermissionTypeData> ptdList = new List<PermissionDataWrapper.PermissionTypeData>();
                    if(opList != null && opList.size() != 0){
                        for(ObjectPermissions opData : opList){
                            permissions.add(getPermissionObject(opData));
                            pspdRowspan += 1;
                            pdwRowspan += 1;
                        }
                        ptdList.add( new PermissionDataWrapper.PermissionTypeData('Object Permissions', permissions, permissions.size()));
                    }
                    permissions = new List<PermissionDataWrapper.Permission>();
                    if(fpList != null && fpList.size() != 0){
                        for(FieldPermissions fpData : fpList){
                            permissions.add(getPermissionObject(fpData));
                            pspdRowspan += 1;
                            pdwRowspan += 1;
                        }
                        ptdList.add( new PermissionDataWrapper.PermissionTypeData('Field Permissions', permissions, permissions.size()));
                    }
                    pspd.permissionTypeData = ptdList;
                    pspd.rowspan = pspdRowspan;
                    pspdList.add(pspd);
                }
            }
            pdw.permissionSetProfileData = pspdList; 
            pdw.rowspan = pdwRowspan; 
            wrappedData.add(pdw);
        }
        return wrappedData;
    }
    private static PermissionDataWrapper.Permission getPermissionObject(SObject obj){
        String access = 'Read';
        if(obj.getSObjectType() == Schema.ObjectPermissions.getSObjectType()){
            if((boolean)obj.get('PermissionsEdit')){
                access += ', Edit';
            }
            if((boolean)obj.get('PermissionsCreate')){
                access += ', Create';
            }
            if((boolean)obj.get('PermissionsDelete')){
                access += ', Delete';
            }
            if((boolean)obj.get('PermissionsViewAllRecords')){
                access += ', View All Records';
            }
            if((boolean)obj.get('PermissionsModifyAllRecords')){
                access += ', Modify All Records';
            }
            return new PermissionDataWrapper.Permission((String) obj.get('SobjectType'), access);
        } else if(obj.getSObjectType() == Schema.FieldPermissions.getSObjectType()){
            if((boolean)obj.get('PermissionsEdit')){
                access += ', Edit';
            }
          	return new PermissionDataWrapper.Permission((String) obj.get('Field'), access);
        }
       return null;
    }

    private List<ComboboxDataWrapper> convertPermissionSetsToWrapper(List<PermissionSet> permissionSets){
        List<ComboboxDataWrapper> wrappedData = new List<ComboboxDataWrapper>();
        for(PermissionSet ps : permissionSets){
            wrappedData.add(new ComboboxDataWrapper(ps.Label, ps.Id));
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