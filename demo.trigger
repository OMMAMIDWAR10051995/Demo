trigger demo on CR20__canditate__c (before insert) {

    
    for (CR20__canditate__c a : [SELECT Id FROM CR20__canditate__c
                     WHERE 
                     Id IN :Trigger.old]) {
         Trigger.oldMap.get(a.Id).addError(
            'Cannot delete account with related .');
    }
}