public interface IFieldPermissionSelector extends fflib_ISObjectSelector {
	List<FieldPermissions> getAllRecords();
	List<FieldPermissions> getRecordsByObject(String objectName);
}