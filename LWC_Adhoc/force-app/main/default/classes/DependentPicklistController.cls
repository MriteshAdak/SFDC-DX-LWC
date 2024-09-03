public with sharing class DependentPicklistController {
    @AuraEnabled(cacheable=true)
    public static Map<String, List<String>> getControllingAndDependentPicklistValues() {
        // Define a map to hold controlling and dependent picklist values
        Map<String, List<String>> picklistMap = new Map<String, List<String>>();

        // Fetch picklist values for Country (Controlling Field)
        Schema.DescribeFieldResult countryField = Account.Country__c.getDescribe();
        List<Schema.PicklistEntry> countryValues = countryField.getPicklistValues();

        // Iterate through each country value to get its dependent state values
        for (Schema.PicklistEntry countryValue : countryValues) {
            String country = countryValue.getValue();
            List<String> stateValues = new List<String>();

            // Fetch dependent state values based on the selected country
            Map<String, Schema.SObjectField> fieldMap = Account.SObjectType.getDescribe().fields.getMap();
            Schema.DescribeFieldResult stateField = fieldMap.get('BillingState').getDescribe();

            // Get dependent picklist values
            List<Schema.PicklistEntry> dependentStates = stateField.getDependentPicklistValues(country);
            for (Schema.PicklistEntry state : dependentStates) {
                stateValues.add(state.getValue());
            }

            // Add to the map with the country as key and corresponding states as values
            picklistMap.put(country, stateValues);
        }

        return picklistMap;
    }
}