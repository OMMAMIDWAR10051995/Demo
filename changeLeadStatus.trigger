trigger changeLeadStatus on Task (before insert, before update) {
    String desiredNewLeadStatus = 'Working - Contacted';
    List<Id> leadIds=new List<Id>();
    for(Task t:trigger.new)
    {
            if(String.valueOf(t.whoId).startsWith('00Q')==TRUE)
            {        
                leadIds.add(t.whoId);   
            }
      
    }
    List<Lead> leadsToUpdate=[SELECT Id, Status FROM Lead WHERE Id IN :leadIds AND IsConverted=FALSE];
    For (Lead l:leadsToUpdate){
        if(l.Status=='Open - Not Contacted')
        l.Status=desiredNewLeadStatus;
    }
    
    try{
        update leadsToUpdate;
    }catch(DMLException e){
        system.debug('Leads were not all properly updated.  Error: '+e);
    }
}