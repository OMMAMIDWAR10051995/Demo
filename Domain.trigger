trigger Domain on Domain_and_Hosting__c (after update) 
{
if(trigger.isAfter && trigger.isupdate)
    {
        
        set<string> idsSet = new set<string>();
        set<string> currentId = new set<string>();
        
        for(Domain_and_Hosting__c c1 : Trigger.new)
        {
            
            if(c1.Id!=null)
            {
                   idsSet.add(c1.CR20__Operation__c);
                    currentId.add(c1.Id);              
                
            }
            
        }  
        
        
        system.debug('idlist::'+idsSet+' size::'+idsSet.size());
        system.debug('--currentId is --'+currentId+'currentId size is'+currentId.size());
        list<Domain_and_Hosting__c> childRecord=[select id,Name,CR20__Operation__r.Name from Domain_and_Hosting__c where Id IN: idsSet ];
        system.debug('releated Record::'+childRecord+'childRecord size::'+childRecord.size());
        list<Domain_and_Hosting__c> updateConList = new list<Domain_and_Hosting__c>();
        
        
        
        if(idsSet.size()>0)
        {
            list<Operation__c> updatedAcclist = new list<Operation__c>();
            list<Operation__c> AccList= [select id, name from Operation__c where Id in:idsSet];
            system.debug('releated AccList Record::'+AccList+'childRecord size::'+AccList.size());
            for(Operation__c a1: accList) 
            {
                System.debug('Operation__c list:: '+a1);            
                for(Domain_and_Hosting__c c: trigger.new)
                {
                    System.debug('Loop 2');
                    //System.debug('Current Domain_and_Hosting__c::'+c.Name+' Domain_and_Hosting__c Name'+c.LastName);
                    if(c.Id!=null)
                    {                                               
                        //a1.CR20__SLASerialNumber__c=c.id;
                        //system.debug('CR20__SLASerialNumber__c::::::::::::'+a1.CR20__SLASerialNumber__c);
                        a1.CR20__Domain_Service__c = c.CR20__Domain_Service__c;
                        a1.CR20__Client_Email__c = c.CR20__Email__c;
                        a1.CR20__Domain_and_Hosting_Name__c = c.Name;
                        updatedAcclist.add(a1);
                    }
                }
            }
            update updatedAcclist;
        }
        
        
    } 
}