public interface IObjectPermissionSelector extends fflib_ISObjectSelector {
    List<ObjectPermissions> getObjectPermissionsByPermissionSet(Id PermissionSetId);
     List<ObjectPermissions> getObjectPermissionsByProfile(Id ProfileId);
}