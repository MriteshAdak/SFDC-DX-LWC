public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String name) {
        List<List<sObject>> queriedRecords = [FIND :name IN NAME FIELDS RETURNING Contact, Lead];
        return queriedRecords;
    }
}