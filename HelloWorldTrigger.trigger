trigger HelloWorldTrigger on CR20__book1__c (before insert) {
    
    Book1__c[] books = Trigger.new;
    MyHelloWorld.applyDiscount(books);

}