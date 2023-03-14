public interface IFieldPermissionSelector extends fflib_ISObjectSelector {
	List<FieldPermissions> getFieldPermissionsByPermissionSet(Id PermissionSetId, String ObjName);
    List<FieldPermissions> getFieldPermissionsByProfile(Id ProfileId, String ObjName);
}