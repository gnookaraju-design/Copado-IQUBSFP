@isTest
private class AccountServiceTest {

    @isTest
    static void testGetAccounts() {

        Account acc = new Account(
            Name = 'Test Account',
            Industry = 'Technology',
            Phone = '1234567890'
        );
        insert acc;

        Test.startTest();
        List<Account> accounts = AccountService.getAccounts();
        Test.stopTest();

        System.assertNotEquals(null, accounts);
        System.assertEquals(1, accounts.size());
        System.assertEquals('Test Account', accounts[0].Name);
    }

    @isTest
    static void testCreateAccount() {

        Test.startTest();
        Account acc = AccountService.createAccount('Copado Test Account');
        Test.stopTest();

        System.assertNotEquals(null, acc.Id);

        Account createdAccount = [
            SELECT Id, Name
            FROM Account
            WHERE Id = :acc.Id
        ];

        System.assertEquals(
            'Copado Test Account',
            createdAccount.Name
        );
    }
}