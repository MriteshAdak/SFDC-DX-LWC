@isTest
private class AccountManagerTest {
    @isTest private static void getAccountTest() {
        Id testRecordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://yourInstance.my.salesforce.com/services/apexrest/Accounts/' + testRecordId + '/contacts';
        request.HttpMethod = 'GET';
        RestContext.request = request;
        
        Account testResult = AccountManager.getAccount();
        Assert.isTrue(testResult != null);
        Assert.areEqual(testRecordId, testResult.Id);
    }

	//Helper Method
    static Id createTestRecord() {
        // Create test record
        Account accTest = new Account(Name='Random Test Account');
        insert accTest;
        Contact conTest = new Contact(LastName = 'Random', AccountId = accTest.Id);
        insert conTest;
        return accTest.Id;
    }
}