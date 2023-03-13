public class ProfileSelector {
    
    public List<Profile> getProfiles(){
        List<Profile> profiles= [SELECT Id, Name FROM Profile];
        return profiles;
    }
}