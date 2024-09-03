public class ContactSearch {
    public static Contact[] searchForContacts(String lastName, String postalCode) {
        List<Contact> queriedContacts = new List<Contact>();
        queriedContacts = [SELECT Id, Name FROM Contact WHERE (LastName=:lastName AND MailingPostalCode=:postalCode)];
        return queriedContacts;
    }
}