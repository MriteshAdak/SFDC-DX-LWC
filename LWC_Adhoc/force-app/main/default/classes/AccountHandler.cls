public class AccountHandler {
    public static Account insertNewAccount(String accName) {
        Account AccDetail = new Account(Name = accName);
        try {
            insert AccDetail;
            return AccDetail;
        }
        catch(Exception ex) {
            System.debug('DML operation failed because :' + ex.getMessage());
            return null;
        }
    }
}