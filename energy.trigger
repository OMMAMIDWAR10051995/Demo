trigger energy on CR20__Energy_Audit__c (before insert) {

 list<id> idlist = new list<id>();
 for(CR20__Energy_Audit__c eng : trigger.new){
    idlist.add(eng.CR20__Account__c);          
    }   
    system.debug('idlist'+idlist+'size'+idlist.size());
    
 list<CR20__Energy_Audit__c> releatedenergyauditlist = [select id,Name,CR20__Account__c,CR20__IsPrimary__c 
                                                       from
                                                       CR20__Energy_Audit__c
                                                       where
                                                       CR20__Account__r.id IN: idlist
                                                       ]; 
     system.debug('releatedenergyauditlist'+releatedenergyauditlist+'releatedenergyauditlistsize'+releatedenergyauditlist.size());
    for(CR20__Energy_Audit__c enggg : trigger.new){
        if(releatedenergyauditlist.isEmpty()){
            enggg.CR20__IsPrimary__c = true;
        }
        
    }  
}