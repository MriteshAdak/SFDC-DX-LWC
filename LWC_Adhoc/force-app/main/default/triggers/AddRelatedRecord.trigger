trigger AddRelatedRecord on Account (after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    Map<Id, Account> acctsWithOpps = new Map<Id, Account>([
        SELECT Id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.new
    ]);
    for(Account acc : Trigger.new) {
        System.debug(acc.Name + 'account has this many opportunites: ' + acctsWithOpps.get(acc.Id).Opportunities.size());
        if(acctsWithOpps.get(acc.Id).Opportunities.size() == 0) {
            Opportunity newOpp = new Opportunity(Name = acc.Name + ' Opportunity', 
                                                     StageName = 'Prospecting',
                                                     CloseDate = System.today().addMonths(1),
                                                     AccountId = acc.Id);
            oppList.add(newOpp);
        }
    }
    if(oppList.size() > 0){
        insert oppList;
    }
}