public interface IFieldPermissionSelector extends fflib_ISObjectSelector {
	List<FieldPermissions> getFieldPermissions(Id PermissionSetId, String ObjName);
}