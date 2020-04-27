trigger mailingaddress on Contact (after update) 
{
if(trigger.isafter && trigger.isupdate)
    {
        
        set<id> idsSet = new set<id>();
      
        
        for(Contact c1 : Trigger.new)
        {
            
            if(c1.AccountId!=null)
            {
                
                    idsSet.add(c1.AccountId);              
                
            }
            
        }  
        system.debug('idlist::'+idsSet+' size::'+idsSet.size());
        list<contact> childRecord=[select id,Name,Account.Name from contact where AccountId IN: idsSet];
      
        
        if(idsSet.size()>0)
        {
            list<account> updatedAcclist = new list<account>();
            list<Account> AccList= [select id, name,BillingAddress from Account where id in:idsSet];
            system.debug('releated AccList Record::'+AccList+'childRecord size::'+AccList.size());
            for(Account a1: accList) 
            {
                System.debug('Account list:: '+a1);            
                for(Contact c: trigger.new)
                {
                    System.debug('Loop 2');
                    System.debug('Current Contact::'+c.AccountId+' contact Name'+c.LastName);
                    if(c.AccountId!=null)
                   {   
                    if(a1.BillingAddress == null){                                            
                        a1.BillingCity = c.MailingCity;
                        a1.BillingCountry = c.MailingCountry;
                        a1.BillingState = c.MailingState;
                        a1.BillingStreet = c.MailingStreet; 
                        a1.BillingPostalCode = c.MailingPostalCode; 
                        updatedAcclist.add(a1);
                       }
                    }
                }
            }
            update updatedAcclist;
        }
        
        
    } 
}