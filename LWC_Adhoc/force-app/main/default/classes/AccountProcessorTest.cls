@isTest
private class AccountProcessorTest {
    
    @isTest
    private static void TestNumberOfContacts() {
        
        List<Account> testAccounts = new List<Account>();
        for(Integer i=0; i<370; i++) {
            Account tempAcc = new Account(Name = 'AC'+i);
            testAccounts.add(tempAcc);
        }
        insert testAccounts;
        
        List<Contact> testContacts = new List<Contact>();
        List<Id> AccountIds = new List<Id>();
        for(Account a : testAccounts) {
            Contact tempCon = new Contact(LastName = 'C of'+ a.Name, AccountId = a.Id);
            testContacts.add(tempCon);
            AccountIds.add(a.Id);
        }
        insert testContacts;
        
        Test.startTest();
    	AccountProcessor.countContacts(AccountIds);
    	Test.stopTest();
        
        List<Account> AccountList = [SELECT Id, Number_Of_Contacts__c FROM Account WHERE Id IN :AccountIds];
        for(Account a : AccountList) {
            System.assertEquals(1, a.Number_Of_Contacts__c, 'ERROR: At least one record with incorrect number of Contacts reported');
        }
    }
}