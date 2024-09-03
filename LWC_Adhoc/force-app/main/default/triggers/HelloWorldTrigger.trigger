trigger HelloWorldTrigger on Account (before insert) {
    for(Account acc : Trigger.new) {
        acc.description = 'New created from HelloWorld Trigger';
    }
}