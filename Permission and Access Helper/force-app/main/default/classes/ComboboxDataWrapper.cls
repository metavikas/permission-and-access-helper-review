/**
 * Copyright (c) - Metacube Software Private Limited
 * All rights reserved
 *
 * Date - April 27, 2023
 *
 */
public class ComboboxDataWrapper {
    @AuraEnabled
    public String label;
    @AuraEnabled
    public String value;

    public ComboboxDataWrapper(String label, String value) {
        this.label = label;
        this.value = value;
    }
}
