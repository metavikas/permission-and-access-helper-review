public with sharing class ComboboxDataWrapper {

    @AuraEnabled
    public String label;
    @AuraEnabled
    public String value;
     
    public ComboboxDataWrapper( String label, String value) {
        this.label = label;
        this.value = value;
    }
}