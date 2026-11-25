public with sharing class AccountService {

    public static List<Account> getAccounts() {
        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            LIMIT 100
        ];
    }

    public static Account createAccount(String accountName) {
        Account acc = new Account();
        acc.Name = accountName;
        insert acc;

        return acc;
    }
}