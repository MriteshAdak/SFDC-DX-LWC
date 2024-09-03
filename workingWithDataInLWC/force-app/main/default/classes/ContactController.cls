public with sharing class ContactController {
    // public ContactController() {

    // }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        throw new AuraHandledException('Forced error');
        // try {
        //     return [SELECT FirstName, LastName, Email FROM Contact];
            
        // } catch (Exception e) {
        //     throw new AuraHandledException(e.getMessage());
        // }
    }
}