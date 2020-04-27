trigger ContactCount on Contact (after insert, after update) {
    Set<Id> setAccountIds = new Set<Id>();
    List<Account> accountsToUpdate = new List<Account>();
    Map<Id,List<Contact>> mapAccountContact = new Map<Id,List<Contact>>();
    for(Contact con: trigger.new){
        setAccountIds.add(con.AccountId);
    }
    List<Account> accounts = [Select Id, No_of_Contacts_SFDC__c , (Select Id,Name from Contacts) from Account where Id IN: setAccountIds];
    for(Account acc: accounts){
        List<Contact> contacts = acc.getSObjects('Contacts');
        mapAccountContact.put(acc.Id,contacts);
    }
    for(Account a: accounts){
        a.No_of_Contacts_SFDC__c = mapAccountContact.get(a.Id).size();
        accountsToUpdate.add(a);
    }
    if(!accountsToUpdate.isEmpty())
        update accountsToUpdate;
}