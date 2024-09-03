public class AccountProcessor {
	
    @future
    public static void countContacts(List<Id> recordIds) {
        List<Account> accountsList = [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :recordIds];
        for (Account a : accountsList) {
            a.Number_Of_Contacts__c = a.Contacts.size();
        }
        
        update accountsList;
    }
}