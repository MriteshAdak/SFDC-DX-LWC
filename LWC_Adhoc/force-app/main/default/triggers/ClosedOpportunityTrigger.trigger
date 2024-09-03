trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasksToAdd = new List<Task>();
    List<Opportunity> closedWonOpps = [SELECT Id FROM Opportunity WHERE StageName = 'Closed Won' AND Id IN :Trigger.new];
    for(Opportunity opp : closedWonOpps) {
        Task addTask = new Task(
            Subject = 'Follow Up Test Task',
            WhatId = opp.Id
        );
        tasksToAdd.add(addTask);
    }
    if(tasksToAdd.size() > 0) {
        insert tasksToAdd;
    }
}